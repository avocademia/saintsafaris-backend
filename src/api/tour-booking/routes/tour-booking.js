module.exports = {
  routes: [
    {
      method: 'POST',
      path: '/tour-bookings',
      handler: 'tour-booking.create',
      config: {
        auth: false
      }
    },
  ]
}