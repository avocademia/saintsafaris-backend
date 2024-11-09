'use strict'

module.exports = {

  async getAccessToken(ctx) {

    try {

      const accessToken = ctx.cookies.get('accessToken')
      ctx.send({ accessToken });

    } catch (error) {

      ctx.throw(500, 'Internal Server Error')

    }
  },
}
