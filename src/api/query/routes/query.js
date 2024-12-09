'use strict'

module.exports = {
    routes: [
        {
          method: 'POST',
          path: '/queries',
          handler: 'query.create',
        },
      ]
}
