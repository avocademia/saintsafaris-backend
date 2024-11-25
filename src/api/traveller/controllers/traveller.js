const validator = require('validator')

module.exports = {
  async create(ctx) {
    try {

      const { booking, travelers } = ctx.request.body

      if (!booking) {
        ctx.throw(400, 'Booking ID is required');
      }

      const travelerEntries = travelers.map((traveler) => ({
        title: traveler.title,
        name: traveler.full_name ? validator.escape(traveler.full_name) : '',
        nationality: traveler.nationality ? validator.escape(traveler.nationality) : '',
        id_type: traveler.identification_type
          ? validator.escape(traveler.identification_type)
          : '',
        id_number: traveler.identification_no ? validator.escape(traveler.identification_no) : '',
        booking: booking,
      }))

      await Promise.all(
        travelerEntries.map(async (traveler) => {
          await strapi.db.query('api::traveller.traveller').create({
            data: traveler,
          })
        })
      )

      ctx.body = {
        message: 'Travelers added successfully!',
      }
    } catch (error) {
      ctx.throw(500, 'An error occurred while adding travelers', error.message);
    }
  },
}
