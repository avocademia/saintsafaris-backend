module.exports = ({ env }) => ({
    'users-permissions': {
      enabled: true,
      config: {
        jwt: {
          expiresIn: '15m',
          httpOnly: true
        },
      },
    },
  });