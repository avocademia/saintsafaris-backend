'use strict'

const FetchUser = require('../../../middleware/fetchUser')
const GetClientIP = require('../../../middleware/getClientIP')
const Authorization = require('../../../middleware/authorization')
const validator = require('validator')

module.exports = {
    async index(ctx) {
        try {
            
            const { tourid } = ctx.params
            const entities = await strapi.db.query('api::review.review').findMany({
                filters: {
                    tourid: {
                        $eq: tourid,
                    },
                },
            })
            ctx.body = entities
        } catch (error) {
            ctx.throw(500, 'An error occurred while fetching reviews')
        }
    },

    async find(ctx) {
        try {

            const { tourid, username } = ctx.params
            const entities = await strapi.db.query('api::review.review').findMany({
                filters: {
                    tourid: {
                        $eq: tourid,
                    },
                    username: {
                        $eq: username,
                    },
                },
            })
            ctx.body = entities
        } catch (error) {
            ctx.throw(500, 'An error occurred while fetching reviews')
        }
    },

    async create(ctx) {

        const clientIP =  GetClientIP(ctx)
        const authorized = await Authorization(ctx, clientIP)
        const user = await FetchUser(ctx)

        if (authorized && user) {

            try {
                const { body } = ctx.request
    
                if (body.data.rating > 5){
                    return ctx.throw (400,'invalid rating')
                }
    
                const sanitizedData = {
                   body: validator.escape(body.data.body),
                   username: validator.escape(body.data.username),
                   first_name: validator.escape(body.data.first_name),
                   surname: validator.escape(body.data.surname),
                   rating: parseInt(body.data.rating),
                   tourid: parseInt(body.data.tourid)
                }
    
                const res = await strapi.service('api::review.review').create({
                    data: sanitizedData,
                })
    
                ctx.send ({
                    review : res,
                    jwt: authorized
                }) 
                
            } catch (error) {
                ctx.throw(500, 'An error occurred while creating a review')
            }
        }

        if (!authorized || !user) {
            ctx.throw(400, 'user not found/unauthorized')
        }
    },
}
