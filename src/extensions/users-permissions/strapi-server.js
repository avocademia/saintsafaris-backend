'use-strict'

        const utils = require('@strapi/utils');
        const { getService } = require('../users-permissions/utils');
        const jwt = require('jsonwebtoken');
        const _ = require('lodash');
        const {
            validateCallbackBody
        } = require('../users-permissions/controllers/validation/auth');
    
        const { setMaxListeners } = require('process');
        const { sanitize } = utils;
        const { ApplicationError, ValidationError } = utils.errors;
        const sanitizeUser = (user, ctx) => {
            const { auth } = ctx.state;
            const userSchema = strapi.getModel('plugin::users-permissions.user');
            return sanitize.contentAPI.output(user, userSchema, { auth });
        };

        const issueJWT = (payload, jwtOptions = {}) => {
            _.defaults(jwtOptions, strapi.config.get('plugin.users-permissions.jwt'));
            return jwt.sign(
                _.clone(payload.toJSON ? payload.toJSON() : payload),
                strapi.config.get('plugin.users-permissions.jwtSecret'),
                jwtOptions
            );
        }

        const issueRefreshToken = (userId) => {
            return jwt.sign(
                { id: userId },
                process.env.JWT_REFRESH_SECRET,
                { expiresIn: process.env.JWT_REFRESH_EXPIRES }  // e.g., '14d'
            );
        }
        
    
        module.exports = (plugin) => {
            plugin.controllers.auth.callback = async (ctx) => {
                const provider = ctx.params.provider || 'local';
                const params = ctx.request.body;
                const store = strapi.store({ type: 'plugin', name: 'users-permissions' });
                const grantSettings = await store.get({ key: 'grant' });
                const grantProvider = provider === 'local' ? 'email' : provider;
                if (!_.get(grantSettings, [grantProvider, 'enabled'])) {
                    throw new ApplicationError('This provider is disabled');
                }
                if (provider === 'local') {
                    await validateCallbackBody(params);
                    const { identifier } = params;
                    // Check if the user exists.
                    const user = await strapi.query('plugin::users-permissions.user').findOne({
                        where: {
                            provider,
                            $or: [{ email: identifier.toLowerCase() }, { username: identifier }],
                        },
                    });
                    if (!user) {
                        throw new ValidationError('Invalid identifier or password');
                    }
                    if (!user.password) {
                        throw new ValidationError('Invalid identifier or password');
                    }
                    const validPassword = await getService('user').validatePassword(
                        params.password,
                        user.password
                    );
                    if (!validPassword) {
                        throw new ValidationError('Invalid identifier or password');
                      } else {
                        const accessToken = issueJWT({ id: user.id }, { expiresIn: process.env.JWT_SECRET_EXPIRES });
                        const refreshToken = issueRefreshToken(user.id);

                        await strapi.query('api::refresh-token.refresh-token').create({
                            data: {
                                token: refreshToken,
                                user_id: user.id,
                                username: user.username,
                                expiration_date: new Date(Date.now() + 30 * 24 * 60 * 60 * 1000)  // 30 days from now
                            }
                        });

                          ctx.send({
                            status: 'Authenticated',
                            jwt: accessToken,
                            user: await sanitizeUser(user, ctx),
                          });
                      }
                    const advancedSettings = await store.get({ key: 'advanced' });
                    const requiresConfirmation = _.get(advancedSettings, 'email_confirmation');
                    if (requiresConfirmation && user.confirmed !== true) {
                        throw new ApplicationError('Your account email is not confirmed');
                    }
                    if (user.blocked === true) {
                        throw new ApplicationError('Your account has been blocked by an administrator');
                    }
                    return ctx.send({
                        jwt: getService('jwt').issue({ id: user.id }),
                        user: await sanitizeUser(user, ctx),
                    });
                }
                // Connect the user with a third-party provider.
                try {
                    const user = await getService('providers').connect(provider, ctx.query);
                    return ctx.send({
                        jwt: getService('jwt').issue({ id: user.id }),
                        user: await sanitizeUser(user, ctx),
                    });
                } catch (error) {
                    throw new ApplicationError(error.message);
                }
            }
            return plugin
        }