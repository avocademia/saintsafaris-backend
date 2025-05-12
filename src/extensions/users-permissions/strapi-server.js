'use-strict'

const GetClientIP = require('../../middleware/getClientIP')
const utils = require('@strapi/utils');
const { getService } = require('./utils')
const jwt = require('jsonwebtoken')
const _ = require('lodash')
const {
    validateCallbackBody,
    validateRegisterBody
} = require('./controllers/validation/auth')
    
const { setMaxListeners } = require('process')
const { sanitize } = utils;
const { ApplicationError} = utils.errors

const sanitizeUser = (user, ctx) => {
    const { auth } = ctx.state
    const userSchema = strapi.getModel('plugin::users-permissions.user')
    return sanitize.contentAPI.output(user, userSchema, { auth })
}

const issueJWT = (payload, jwtOptions = {}) => {
    _.defaults(jwtOptions, strapi.config.get('plugin.users-permissions.jwt'))

    return jwt.sign(
        _.clone(payload.toJSON ? payload.toJSON() : payload),
        strapi.config.get('plugin.users-permissions.jwtSecret'),
        jwtOptions
    )
}

const issueRefreshToken = (userId) => {
    return jwt.sign(
        { id: userId },
        process.env.JWT_REFRESH_SECRET,
        { expiresIn: process.env.JWT_REFRESH_EXPIRES }
    )
}
        
    
module.exports = (plugin) => {
    plugin.controllers.auth.callback = async (ctx) => {

        const provider = ctx.params.provider || 'local'
        const params = ctx.request.body;
        const store = strapi.store({ type: 'plugin', name: 'users-permissions' })
        const grantSettings = await store.get({ key: 'grant' })
        const grantProvider = provider === 'local' ? 'email' : provider
        let accessToken
        let refreshToken

        if (!_.get(grantSettings, [grantProvider, 'enabled'])) {
            throw new ApplicationError('This provider is disabled')
        }
                
        if (provider === 'local') {
            await validateCallbackBody(params)
            const { identifier } = params
        
            const user = await strapi.query('plugin::users-permissions.user').findOne({
                where: {
                    provider,
                    $or: [{ email: identifier.toLowerCase() }, { username: identifier }],
                    },
                })

                if (!user) {
                    ctx.throw(403, 'Invalid identifier or password')
                }

                if (!user.password) {
                    ctx.throw(403, 'Invalid identifier or password')
                }

                const validPassword = await getService('user').validatePassword(
                    params.password,
                    user.password
                )

                const advancedSettings = await store.get({ key: 'advanced' })
                const requiresConfirmation = _.get(advancedSettings, 'email_confirmation')

                if (requiresConfirmation && user.confirmed !== true) {
                    ctx.throw(403, 'Your account email is not confirmed')
                }

                if (user.blocked === true) {
                    ctx.throw(403, 'Your account has been blocked by an administrator')
                }
                    
                if (!validPassword) {
                    ctx.throw(403, 'Invalid identifier or password');
                } else {

                    accessToken = issueJWT({ id: user.id }, { expiresIn: process.env.JWT_SECRET_EXPIRES })
                    refreshToken = issueRefreshToken(user.id)
                    const clientIP = GetClientIP(ctx)

                    await strapi.query('api::refresh-token.refresh-token').create({
                        data: {
                            token: refreshToken,
                            user_id: user.id,
                            username: user.username,
                            expiration_date: new Date(Date.now() + 30 * 24 * 60 * 60 * 1000),//30d
                            ip_address: clientIP
                        }
                    })

                    ctx.send({
                        status: 'Authenticated',
                        jwt: process.env.NODE_ENV === 'production'? 'token availablea': accessToken,
                        user: await sanitizeUser(user, ctx),
                    })
                }
        }
    }
    return plugin
}