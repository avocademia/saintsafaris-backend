'use strict'

const validator = require('validator')

module.exports = {
    async create(ctx) {
      const { full_name, email, subject, message } = ctx.request.body

      try {
        const sanitizedData = {
          full_name: validator.escape(full_name),
          email: validator.escape(email),
          subject: validator.escape(subject),
          message: validator.escape(message)
        }
    
        const entity = await strapi.service('api::query.query').create({
          data: {
              ...sanitizedData
          }
        })

        if (entity) {
          ctx.body = {
            message: 'query successfully sent'
          }
        }
    
      } catch (error) {
        ctx.throw(500, 'Error submitting request')
      }
      const notificationMsg = {
        to: 'info@saintsafaris.com',
        cc: 'vizionbnm@gmail.com',
        from: 'no-reply@saintsafaris.com',
        subject: `New Query: ${subject}`,
        text: `Full Name: ${full_name}\nEmail: ${email}\nMessage: ${message}`,
      }
  
      try {
        await strapi.plugins['email'].services.email.send(notificationMsg);
      } catch (error) {
        console.error('Error sending notification email:', error);
      }
    },
  }