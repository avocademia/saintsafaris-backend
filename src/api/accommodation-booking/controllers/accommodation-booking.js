const FetchUser = require('../../../middleware/fetchUser')
const GetClientIP = require('../../../middleware/getClientIP') 
const Authorization = require('../../../middleware/authorization')
const validator = require('validator')


module.exports = {
  async create(ctx) {

    const clientIp = await GetClientIP(ctx)
    const authorized = await Authorization(ctx, clientIp)
    const user = await FetchUser(ctx)

    if (authorized && user) {

      try {

        const {
          check_in,check_out,
          adults,children,
          purpose,other_purpose,
          room_type,bed_preferences,
          view_preferences,budget,
          other_budget,payment_method,
          amenities,
        } = ctx.request.body
  
        const sanitizedData = {
          check_in: check_in ? validator.toDate(check_in) : null,
          check_out: check_out ? validator.toDate(check_out) : null,
          adults: parseInt(adults, 10) || 0,
          children: parseInt(children, 10) || 0,
          purpose: purpose ? validator.escape(purpose) : '',
          other_purpose: other_purpose ? validator.escape(other_purpose) : '',
          room_type: room_type ? validator.escape(room_type) : '',
          budget: budget ? validator.escape(budget) : '',
          other_budget: other_budget ? validator.escape(other_budget) : '',
          payment_method: payment_method ? validator.escape(payment_method) : '',
          amenities: Array.isArray(amenities) ? amenities.map(validator.escape) : [],
          bed_preferences: Array.isArray(bed_preferences) ? bed_preferences.map(validator.escape) : [],
          view_preferences: Array.isArray(view_preferences)? view_preferences.map(validator.escape) : [],
          user_id: user.id
        }
  
        const booking = await strapi.db.query('api::accommodation-booking.accommodation-booking').create({
          data: sanitizedData
        })
  
  
        if (!booking || !booking.id) {
          ctx.throw(400, 'Failed to create booking')
        }
  
        ctx.send( {
          message: 'Booking created successfully!',
          bookingId: booking.id,
          jwt: authorized
        })

        const confirmationMsg = {
          to: user.email,
          from: 'no-reply@saintsafaris.com',
          subject: 'Accommodation Booking Confirmation',
          text: `Hello ${user.first_name},
                 Your accommodation booking has been received and is being processed.
                 We will contact you shortly with all available options.`
        }
  
        try {
          await strapi.plugins['email'].services.email.send(confirmationMsg);
        } catch (error) {
          console.error('Error sending confirmation email:', error);
        }
  
        const nodeEnv = process.env.NODE_ENV
        const devCCmail = process.env.DEV_CC_EMAIL
        const prodCCmail = process.env.PROD_CC_EMAIL

        const notificationMsg = {
          to: 'bookings@saintsafaris.com',
          cc: nodeEnv === 'production'? prodCCmail:devCCmail,
          from: 'no-reply@saintsafaris.com',
          subject: `New Accommodation Booking ID: ${booking.id}`,
          text: `
                 New accommodation booking received!
                 Name: ${user.first_name || ''} ${user.surname}
                 Contact Number: ${user.phone_number || ''}
                 Email: ${user.email || ''}
                 Adults: ${sanitizedData.adults || 0}
                 Children: ${sanitizedData.children || 0}
                 Check-In: ${sanitizedData.check_in || ''}
                 Check-Out: ${sanitizedData.check_out || ''}
                 Purpose: ${sanitizedData.purpose || ''}${sanitizedData.other_purpose ? ` (Other: ${sanitizedData.other_purpose})` : ''}
                 Room Type: ${sanitizedData.room_type || ''}
                 Bed Preferences: ${sanitizedData.bed_preferences.length > 0 ? sanitizedData.bed_preferences.join(', ') : 'None provided'}
                 View Preferences: ${sanitizedData.view_preferences.length > 0 ? sanitizedData.view_preferences.join(', ') : 'None provided'}
                 Budget: ${budget || ''}${other_budget ? ` (Other: ${other_budget})` : ''}
                 Payment Method: ${payment_method || ''}
                 Amenities: ${amenities.length > 0 ? amenities.join(', ') : 'None provided'}
                        `
          .trim()
        }
  
        try {
          await strapi.plugins['email'].services.email.send(notificationMsg);
        } catch (error) {
          console.error('Error sending notification email:', error, '\nRequest body:', ctx.request.body);
        }
      } catch (error) {
        console.error('Error creating booking:', error);
        ctx.throw(500, 'An error occurred while creating the booking');
      }
    } 
    
    if (!authorized || !user) {
      ctx.throw(400, 'user not found/unauthorized')
    }
  }
};
