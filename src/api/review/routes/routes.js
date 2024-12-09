module.exports = {
    routes: [
      {
        method: 'GET',
        path: '/reviews-by-tourid-username/:tourid/:username',
        handler: 'second-review.index',
      }
    ]
  }