'use strict';

/**
 * tour-booking controller
 */

module.exports = {
    async create(ctx) {
      const { first_name, surname, phone, email, adults, children, city, travel_date, message } = ctx.request.body;
  
      const entity = await strapi.service('api::tour-booking.tour-booking').create({
        data: {
            ...ctx.request.body
        }
      });
  
      const confirmationMsg = {
        to: email,
        from: 'mail@saintsafaris.com',
        subject: 'Booking Confirmation',
        text: `Hello ${first_name}, your booking has been received and is being processed.`,
      };
  
      try {
        await strapi.plugins['email'].services.email.send(confirmationMsg);
      } catch (error) {
        console.error('Error sending confirmation email:', error);
      }
  
      const notificationMsg = {
        to: 'mail@saintsafaris.com',
        from: 'mail@saintsafaris.com',
        subject: 'New Booking Notification',
        text: `New booking received!\n\nFirst Name: ${first_name}\nSurname: ${surname}\nPhone: ${phone}\nEmail: ${email}\nAdults: ${adults}\nChildren: ${children}\nCity of Residence: ${city}\nDate of travel: ${travel_date}\nMessage: ${message}`,
      };
  
      try {
        await strapi.plugins['email'].services.email.send(notificationMsg);
      } catch (error) {
        console.error('Error sending notification email:', error);
      }
  
      return entity;
    },
  };
  
