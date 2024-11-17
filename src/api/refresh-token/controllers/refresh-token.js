'use strict'

const jwt = require('jsonwebtoken')

module.exports = {
    async refreshAccessToken(ctx) {
        const { authorization } = ctx.request.headers

        if (!authorization) {
            ctx.throw(401, 'No access token provided')
        }

        try {

            const accessToken = authorization.split(' ')[1]
            const decoded = jwt.verify(accessToken, process.env.JWT_SECRET)
            ctx.send({ authorized: true })

        } catch (err) {
            if (err.name === 'TokenExpiredError') {

                const { userId, username } = ctx.params;
                const refreshTokenRecord = await strapi.query('api::refresh-token.refresh-token').findOne({
                    where: {
                        user_id: userId,
                        username,
                    }
                })

                if (!refreshTokenRecord) {
                    ctx.throw(401, 'Refresh token not found')
                }

                if (new Date(refreshTokenRecord.expiration_date) < new Date()) {
                    await strapi.query('api::refresh-token.refresh-token').delete({ where: { id: refreshTokenRecord.id } })
                    ctx.throw(401, 'Refresh token expired')
                }

                const newAccessToken = jwt.sign({ id: refreshTokenRecord.user_id }, process.env.JWT_SECRET, { expiresIn: process.env.JWT_SECRET_EXPIRES })     
                ctx.send({
                    authorized: true,
                    jwt: newAccessToken,
                })

            } else {
                ctx.throw(401, 'Invalid access token')
            }
        }
    },
    async deleteRefreshToken(ctx) {
        const {user_id} = ctx.params

        try {
            await strapi.query('api::refresh-token.refresh-token').delete({ where: {user_id} })
        } catch (error) {
            console.log(error)
            ctx.throw(500, 'error deleting auth')
        }
    }
}
