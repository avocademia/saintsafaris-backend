module.exports = [
    {
      method: 'GET',
      path: '/get-user-token',
      handler: 'users-permissions.access-cookie.access.getAccessToken',
      config: {
        policies: [],
      },
    },

  ];
  