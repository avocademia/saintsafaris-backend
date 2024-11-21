module.exports = {
  routes: [
    {
      method: 'POST',
      path: '/flight-booking',
      handler: 'flight-booking.create',
      config: {
        auth: false
      }
    },
  ]
}