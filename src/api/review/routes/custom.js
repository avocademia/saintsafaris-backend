module.exports = {
    routes: [
      {
        method: 'GET',
        path: '/get-reviews-by-id/:tourid',
        handler: 'custom-review.index',
        config: {
            auth: false
        }
      },

      {
        method: 'GET',
        path: '/reviews-by-tourid-username/:tourid/:username',
        handler: 'custom-review.find',
        config: {
            auth: false
        }
      },

      {
        method: 'POST',
        path: '/reviews/create',
        handler: 'custom-review.create',
        config: {
          policies: []
        }
      },
    ]
  }