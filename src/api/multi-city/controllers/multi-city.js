const validator = require('validator')

module.exports = {
  async create(ctx) {
    try {
      const { booking, cities } = ctx.request.body

      console.log('cities req:', ctx.request.body)

      if (!booking) {
        ctx.throw(400, 'Booking ID is required')
      }

      const multiCityEntries = cities.map((city) => ({
        city: city.city ? validator.escape(city.city) : '',
        departure_date: city.date || '1970-01-01',
        booking: booking,
      }))

      await Promise.all(
        multiCityEntries.map(async (entry) => {
          await strapi.db.query('api::multi-city.multi-city').create({
            data: entry,
          })
        })
      )

      ctx.body = {
        message: 'Multi-city destinations added successfully!',
      }
    } catch (error) {
      ctx.throw(500, `${error.message}`)
    }
  },
}
