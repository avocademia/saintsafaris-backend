const validator = require('validator');

module.exports = {
  async create(ctx) {
    try {
      const {
        full_name,
        email,
        contact_number,
        address,
        check_in,
        check_out,
        adults,
        children,
        purpose,
        other_purpose,
        room_type,
        other_room_type,
        bed_preference,
        view_preference,
        smoking_preference,
        accessibility,
        accessibility_specification,
        budget,
        other_budget,
        payment_method,
        amenities = []
      } = ctx.request.body;

      // Input sanitization
      const sanitizedData = {
        full_name: full_name ? validator.escape(full_name) : '',
        email: email ? validator.normalizeEmail(email) : '',
        contact_number: contact_number ? validator.trim(contact_number) : '',
        address: address ? validator.escape(address) : '',
        check_in: check_in ? validator.toDate(check_in) : null,
        check_out: check_out ? validator.toDate(check_out) : null,
        adults: parseInt(adults, 10) || 0,
        children: parseInt(children, 10) || 0,
        purpose: purpose ? validator.escape(purpose) : '',
        other_purpose: other_purpose ? validator.escape(other_purpose) : '',
        room_type: room_type ? validator.escape(room_type) : '',
        other_room_type: other_room_type ? validator.escape(other_room_type) : '',
        bed_preference: bed_preference ? validator.escape(bed_preference) : '',
        view_preference: view_preference ? validator.escape(view_preference) : '',
        smoking_preference: smoking_preference ? validator.escape(smoking_preference) : '',
        accessibility: !!accessibility,
        accessibility_specification: accessibility_specification
          ? validator.escape(accessibility_specification)
          : '',
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
        text: `Hello ${full_name},
Your accommodation booking has been received and is being processed.
We will contact you shortly with all available options.`
      };

      try {
        await strapi.plugins['email'].services.email.send(confirmationMsg);
      } catch (error) {
        console.error('Error sending confirmation email:', error);
      }

      // Sending notification email
      const notificationMsg = {
        to: 'info@saintsafaris.com',
        cc: 'saintsafaris@gmail.com',
        from: 'no-reply@saintsafaris.com',
        subject: `New Accommodation Booking ID: ${booking.id}`,
        text: `
New accommodation booking received!
Name: ${full_name || ''}
Contact Number: ${contact_number || ''}
Email: ${email || ''}
Adults: ${adults || 0}
Children: ${children || 0}
Check-In: ${check_in || ''}
Check-Out: ${check_out || ''}
Purpose: ${purpose || ''}${other_purpose ? ` (Other: ${other_purpose})` : ''}
Room Type: ${room_type || ''}${other_room_type ? ` (Other: ${other_room_type})` : ''}
Bed Preference: ${bed_preference || ''}
View Preference: ${view_preference || ''}
Smoking Preference: ${smoking_preference || ''}
Accessibility: ${accessibility ? 'Yes' : 'No'}${accessibility_specification ? ` (Details: ${accessibility_specification})` : ''}
Budget: ${budget || ''}${other_budget ? ` (Other: ${other_budget})` : ''}
Payment Method: ${payment_method || ''}
Amenities: ${amenities.length > 0 ? amenities.join(', ') : 'None provided'}
        `.trim()
      };

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
