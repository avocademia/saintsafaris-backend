'use strict'

const validator = require('validator')

module.exports = {
  async create(ctx) {
    const {
      first_name,
      surname,
      phone,
      email,
      adults,
      children,
      city,
      travel_date,
      message,
    } = ctx.request.body

    try {

      const sanitizedData = {
        first_name: first_name && validator.isLength(first_name, { min: 1, max: 100 })
          ? validator.escape(first_name)
          : ctx.throw(400, 'Invalid first name'),
        surname: surname && validator.isLength(surname, { min: 1, max: 100 })
          ? validator.escape(surname)
          : ctx.throw(400, 'Invalid surname'),
        phone: phone && validator.isMobilePhone(phone)
          ? validator.escape(phone)
          : ctx.throw(400, 'Invalid phone number'),
        email: email && validator.isEmail(email)
          ? validator.normalizeEmail(email)
          : ctx.throw(400, 'Invalid email'),
        adults: adults && validator.isInt(adults.toString(), { min: 1 })
          ? parseInt(adults, 10)
          : ctx.throw(400, 'Adults must be a positive integer'),
        children: children && validator.isInt(children.toString(), { min: 0 })
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
      };

      const entity = await strapi.service('api::tour-booking.tour-booking').create({
        data: sanitizedData,
      })

      const confirmationMsg = {
        to: sanitizedData.email,
        from: 'no-reply@saintsafaris.com',
        subject: 'Booking Confirmation',
        text: `Hello ${sanitizedData.first_name}, your booking has been received and is being processed.`,
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
        subject: 'New Booking Notification',
        text: `New booking received!
               \n\nFirst Name: ${sanitizedData.first_name}
               \nSurname: ${sanitizedData.surname}
               \nPhone: ${sanitizedData.phone}
               \nEmail: ${sanitizedData.email}
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

      return entity
    } catch (error) {
      console.error('Error in booking creation:', error.message)
      ctx.throw(500, 'An error occurred during booking creation')
    }
  },
}
