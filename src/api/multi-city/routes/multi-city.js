module.exports = {
    routes: [
      {
        method: 'POST',
        path: '/multi-city',
        handler: 'multi-city.create',
        config: {
          auth: false
        }
      },
    ]
  }
