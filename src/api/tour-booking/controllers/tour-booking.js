'use strict'

const FetchUser = require('../../../middleware/fetchUser')
const GetClientIP = require('../../../middleware/getClientIP')
const Authorization = require('../../../middleware/authorization')
const validator = require('validator')

module.exports = {
  async create(ctx) {

    const clientIP = await GetClientIP(ctx)
    const authorized = await Authorization(ctx, clientIP)
    const user = await FetchUser(ctx)

    if (authorized && user) {

      const {
        tour,
        adults,children,
        city,travel_date,message,
      } = ctx.request.body
  
      try {
  
        const sanitizedData = {
          tour: tour && validator.isLength(tour, { min: 1, max: 100 })
            ? validator.escape(tour)
            : ctx.throw(400, 'Invalid tour'),
          adults: adults
            ? parseInt(adults, 10)
            : ctx.throw(400, 'Adults must be a positive integer'),
          children: children
            ? parseInt(children, 10)
            : ctx.throw(400, 'Children must be a non-negative integer'),
          city: city && validator.isLength(city, { min: 1, max: 100 })
            ? validator.escape(city)
            : ctx.throw(400, 'Invalid city'),
          travel_date: travel_date && validator.isISO8601(travel_date)
            ? travel_date
            : ctx.throw(400, 'Invalid travel date'),
          message: message && validator.isLength(message, { max: 1000 })
            ? validator.escape(message)
            : ctx.throw(400, 'Message must not exceed 1000 characters'),
            user_id: user.id
        }
  
        const entity = await strapi.service('api::tour-booking.tour-booking').create({
          data: sanitizedData,
        })
  
        const confirmationMsg = {
          to: user.email,
          from: 'no-reply@saintsafaris.com',
          subject: 'Booking Confirmation',
          text: `Hello ${user.first_name}, your booking has been received and is being processed.`,
        }
  
        try {
          await strapi.plugins['email'].services.email.send(confirmationMsg)
        } catch (error) {
          console.error('Error sending confirmation email:', error)
        }
  
        const nodeEnv = process.env.NODE_ENV
        const devCCmail = process.env.DEV_CC_EMAIL
        const prodCCmail = process.env.PROD_CC_EMAIL
  
        const notificationMsg = {
          to: 'info@saintsafaris.com',
          cc: nodeEnv === 'production'? prodCCmail : devCCmail,
          from: 'no-reply@saintsafaris.com',
          subject: `'New Tour Booking id: ${entity.id} `,
          text: `New booking received!
                 \nTour: ${sanitizedData.tour}
                 \n\nFirst Name: ${user.first_name}
                 \nSurname: ${user.surname}
                 \nPhone: ${user.phone_number}
                 \nEmail: ${user.email}
                 \nAdults: ${sanitizedData.adults}
                 \nChildren: ${sanitizedData.children}
                 \nCity of Residence: ${sanitizedData.city}
                 \nDate of travel: ${sanitizedData.travel_date}
                 \nMessage: ${sanitizedData.message}`,
        }
  
        try {
          await strapi.plugins['email'].services.email.send(notificationMsg);
        } catch (error) {
          console.error('Error sending notification email:', error)
        }
  
        ctx.body = {
          status: 'success',
          jwt: authorized
        }
      } catch (error) {
        console.error('Error in booking creation:', error.message)
        ctx.throw(500, error.message)
      }
    }

    if (!authorized || !user) {

    }
  },
}
