module.exports = {
    routes: [
      {
        method: 'POST',
        path: '/travellers',
        handler: 'traveller.create',
        config: {
          auth: false
        }
      },
    ]
  }
