const jwt = require('jsonwebtoken')

const FetchUser = async (ctx) => {

    const accessToken = ctx.cookies.get('acst')
    const decodedToken = jwt.decode(accessToken)

    if (typeof decodedToken === 'string' ){
        ctx.throw(401, 'invalod token')
        return ctx.cookies.clear('acst')
    } else {

        const {id} = decodedToken
        try {
            const user = await strapi.query('plugin::users-permissions.user').findOne({where: {
                id
            }})

            if (!user) {
                ctx.throw(401, 'invalid user id')
                return ctx.cookies.clear('acst')
            }

            return user

        } catch (error) {
            ctx.throw(500, 'internal server error validating user, we are working on it')
        }
        
    }

}

module.exports = FetchUser