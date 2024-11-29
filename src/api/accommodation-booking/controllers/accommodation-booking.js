const validator = require('validator');


module.exports = {
  async create(ctx) {
    try {

      const {
        full_name,email,
        contact_number, 
        check_in,check_out,
        adults,children,
        purpose,other_purpose,
        room_type,bed_preferences,
        view_preferences,budget,
        other_budget,payment_method,
        amenities,
      } = ctx.request.body

      const sanitizedData = {
        full_name: full_name ? validator.escape(full_name) : '',
        email: email ? validator.normalizeEmail(email) : '',
        contact_number: contact_number ? validator.trim(contact_number) : '',
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
        amenities: Array.isArray(amenities) ? amenities.map(validator.escape) : []
      };


      // Creating a new booking
      const booking = await strapi.db.query('api::accommodation-booking.accommodation-booking').create({
        data: sanitizedData
      });


      if (!booking || !booking.id) {
        ctx.throw(400, 'Failed to create booking');
      }


      ctx.body = {
        message: 'Booking created successfully!',
        bookingId: booking.id
      };


      // Sending confirmation email
      const confirmationMsg = {
        to: email,
        from: 'no-reply@saintsafaris.com',
        subject: 'Accommodation Booking Confirmation',
        text: `Hello ${sanitizedData.full_name},
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


      // Sending notification email
      const notificationMsg = {
        to: 'info@saintsafaris.com',
        cc: nodeEnv === 'production'? prodCCmail:devCCmail,
        from: 'no-reply@saintsafaris.com',
        subject: `New Accommodation Booking ID: ${booking.id}`,
        text: `
               New accommodation booking received!
               Name: ${sanitizedData.full_name || ''}
               Contact Number: ${sanitizedData.contact_number || ''}
               Email: ${sanitizedData.email || ''}
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
};
