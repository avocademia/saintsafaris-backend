const jwt = require('jsonwebtoken')

const Authorization = async (ctx, clientIP) => {
    const accessToken = await ctx.cookies.get('acst')

    if (!accessToken) {
        ctx.throw(401, 'Credentials not provided')
        return false
    }

    const decodedJwt = jwt.decode(accessToken)
    if (!decodedJwt || typeof decodedJwt === 'string') {
        ctx.throw(401, 'Invalid token')
        return false
    }

    if (typeof decodedJwt !== 'string') {

        const { id } = decodedJwt
        const isTokenValid = verifyToken(accessToken, process.env.JWT_SECRET);
    
        if (isTokenValid) {
            return true
        }

        const refreshTokenRecord = await strapi.query('api::refresh-token.refresh-token').findOne({
            where: {
                user_id: parseInt(id),
                ip_address: clientIP,
            },
        })
    
        if (!refreshTokenRecord || new Date(refreshTokenRecord.expiration_date) < new Date()) {
            ctx.throw(401, 'Token expired, sign in again')
            ctx.cookies.clear('acst')
            return false
        }
    
        const newAccessToken = jwt.sign(
            { id: refreshTokenRecord.user_id },
            process.env.JWT_SECRET,
            { expiresIn: process.env.JWT_SECRET_EXPIRES }
        )

        if (newAccessToken) {
            return newAccessToken
        }
    }

}

const verifyToken = (token, secret) => {
    try {
        jwt.verify(token, secret)
        return true;
    } catch (error) {
        if (error.name === 'TokenExpiredError') {
            console.log("Token has expired:", error.message)
            return false
        }
        console.error("Invalid token:", error.message);
        return false
    }
}

module.exports = Authorization
