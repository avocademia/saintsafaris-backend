'use strict'

module.exports = {
    async index (ctx) {
        try {

            const { tourid, username } = ctx.params
            const entities = await strapi.db.query('api::review.review').findMany({
                filters: {
                    tourid: {
                        $eq: tourid
                    },
                    username: {
                        $eq: username
                    }
                }
            })
            ctx.body = entities

        } catch (error) {
            ctx.throw(500, 'An error occurred while fetching reviews')
        }
    },
}
