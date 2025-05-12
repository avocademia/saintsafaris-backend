'use strict';

const GetClientIP = require("../../../middleware/getClientIP") 
const FetchUser = require("../../../middleware/fetchUser");
const Authorization = require('../../../middleware/authorization')
const validator = require('validator')

module.exports = {
    async create(ctx) {

        try {

            const clientIP = await GetClientIP(ctx)
            const authorized = await Authorization(ctx, clientIP)
            const user = await FetchUser(ctx)
            const {message,subject} = ctx.request.body

            if (user && authorized) {

                const sanitiizedData = {
                    subject: validator.escape(subject),
                    message: validator.escape(message),
                    user_id: user.id
                }
    
                await strapi.db.query('api::query.query').create({
                    data: sanitiizedData
                })

                const nodeEnv = process.env.NODE_ENV
                const devCCmail = process.env.DEV_CC_EMAIL
                const prodCCmail = process.env.PROD_CC_EMAIL

                const notificationMsg = {
                    to: 'customercare@saintsafaris.com',
                    cc: nodeEnv === 'production'? prodCCmail : devCCmail,
                    from: 'no-reply@saintsafaris.com',
                    subject: `New Query: ${sanitiizedData.subject} `,
                    text: `
                        \n\nFirst Name: ${user.first_name}
                        \nSurname: ${user.surname}
                        \nPhone: ${user.phone_number}
                        \nEmail: ${user.email}
                        \nMessage: ${sanitiizedData.message}`,
                }

                try {
                    await strapi.plugins['email'].services.email.send(notificationMsg);
                } catch (error) {
                    console.error('Error sending notification email:', error)
                }

                ctx.send({
                    message: 'query sent successfully',
                    jwt: authorized
                })
                            
            }

            if (authorized === false) {
                ctx.throw(400, 'user not found/authorized')
            }

            
        } catch (error) {
            ctx.throw(500, 'internal server error')
        }
        
    }
}
