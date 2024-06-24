module.exports = [
    {
      method: 'GET',
      path: '/get-user-token',
      handler: 'users-permissions.access-cookie.access.getAccessToken',
      config: {
        policies: [], // Additional policies (if needed)
      },
    },
    // Add more custom routes as needed
  ];
  