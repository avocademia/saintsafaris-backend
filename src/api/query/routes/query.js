module.exports = {
    routes: [
      {
        method: 'POST',
        path: '/queries',
        handler: 'query.create',
        config: {
          auth: false
        }
      },
    ]
  }
