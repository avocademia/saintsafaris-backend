

'use strict';

/**
 * tour-booking controller
 */

module.exports = {
    async create(ctx) {
      const { full_name, email, subject, message } = ctx.request.body;
  
      const entity = await strapi.service('api::query.query').create({
        data: {
            ...ctx.request.body
        }
      });
  
      const notificationMsg = {
        to: 'mail@saintsafaris.com',
        from: 'mail@saintsafaris.com',
        subject: `New Query: ${subject}`,
        text: `Full Name: ${full_name}\nEmail: ${email}\nMessage: ${message}`,
      };
  
      try {
        await strapi.plugins['email'].services.email.send(notificationMsg);
      } catch (error) {
        console.error('Error sending notification email:', error);
      }
  
      return entity;
    },
  };
  

