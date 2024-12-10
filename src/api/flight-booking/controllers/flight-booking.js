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

      try {

        const {
          adults,children,
          infants,travel_date,city,
          destination,return_date,
          tripType,visaAssistance,
          travelers = [],
          multiCityDestinations = [], 
        } = ctx.request.body
  
        const sanitizedData = {
          adults: parseInt(adults, 10) || 1,
          children: parseInt(children, 10) || 0,
          infants: parseInt(infants, 10) || 0,
          departure_date: validator.toDate(travel_date),
          depart_from: validator.escape(city),
          destination: destination ? validator.escape(destination) : '',
          return_date: return_date ? validator.toDate(return_date) : null,
          trip_type: validator.escape(tripType),
          visa_assistance: visaAssistance,
          user_id: user.id
        }
  
        const booking = await strapi.db.query('api::flight-booking.flight-booking').create({
          data: sanitizedData,
        })
  
        if (!booking || !booking.id) {
          ctx.throw(400, 'Failed to create booking')
        }
  
        ctx.send( {
          message: 'Booking created successfully!',
          bookingId: booking.id,
          jwt: authorized
        })
  
        const travelersList = travelers
          .map(
            (traveler, index) =>
              `${index + 1}. ${traveler.title} ${validator.escape(traveler.full_name)} 
               \n${traveler.nationality}
               \n${traveler.identification_type}
               \n${validator.escape(traveler.identification_no)}`
          )
          .join('\n')
  
        let tripDetails = `\nDeparture Date: ${travel_date}\nFrom: ${city}`
        if (tripType === 'return') {
          tripDetails += `\nDestination: ${destination}
                          \nReturn Date: ${return_date}`
        } else if (tripType === 'multi-city') {
  
          const multiCityDetails = multiCityDestinations
            .map(
              (city, index) =>
                `${index + 1}. ${validator.escape(city.city || '')} (Departure: ${city.date || ''})`
            )
            .join('\n')
          tripDetails += `\nMulti-City Destinations:\n${multiCityDetails}`
  
        } else if (tripType === 'one-way') {
          tripDetails += `\nDestination: ${destination}`
        }
  
        const confirmationMsg = {
          to: user.email,
          from: 'no-reply@saintsafaris.com',
          subject: 'Booking Confirmation',
          text: `Hello ${user.first_name},
                 Your booking has been received and is being processed.
                 We shall contact you shortly with all available options.`,
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
          to: 'info@saintsafaris.com',
          cc: nodeEnv === 'production'? prodCCmail : devCCmail,
          from: 'no-reply@saintsafaris.com',
          subject: `Flight Booking ID: ${booking.id}`,
          text: `New booking received!
                 \n\nName: ${user.first_name} ${user.surname}
                 \nPhone: ${user.phone_number}
                 \nEmail: ${user.email}
                 \nAdults: ${adults || 0}
                 \nChildren: ${children || 0}
                 \nInfants: ${infants || 0}
                 \nCity of Residence: ${city || ''}
                 \n\nTravelers:\n${travelersList || 'No travelers added yet'}
                 \n\nTrip Details:\n${tripDetails}
                 \nVisa Assistance: ${visaAssistance ? 'Yes' : 'No'}`,
        }
  
        try {
          await strapi.plugins['email'].services.email.send(notificationMsg);
        } catch (error) {
          console.error('Error sending notification email:', error, '\nbody:',ctx.request.body)
        }
        
      } catch (error) {
        ctx.throw(500, 'An error occurred while creating the booking', error.message);
      }
    }

    if (!authorized || !user) {
      ctx.throw(400, 'user not found/unauthorized')
    }
  },
}
