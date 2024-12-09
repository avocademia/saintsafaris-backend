'use strict'

const GetClientIP = require('../../../middleware/getClientIP')
const jwt = require('jsonwebtoken')

module.exports = {

    async deleteRefreshToken(ctx) {
        const accessToken = ctx.cookies.get('acst')
        const clientIP = GetClientIP(ctx)

        if (!accessToken || !clientIP) {
            return ctx.throw(401, 'No access token provided')
        } 

        const decoded = jwt.decode(accessToken)
        if (typeof decoded === 'string') {
            return ctx.throw(401, 'invalid access token');
        }
        const {id} = decoded

        try {
            await strapi.query('api::refresh-token.refresh-token').delete({ where: {
                user_id: parseInt(id),
                ip_address: clientIP
                }
            })
            if (process.env.NODE_ENV === 'production') {
                ctx.cookies.clear('acst')
            }
      
        } catch (error) {
            return ctx.throw(500, 'error deleting auth')
        }
    }
}
