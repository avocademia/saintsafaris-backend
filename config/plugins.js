module.exports = ({ env }) => ({
    'users-permissions': {
      enabled: true,
      config: {
        jwt: {
          expiresIn: '120m',
        },
      },
    },
    email: {
      config: {
        provider: 'sendgrid',
        providerOptions: {
          apiKey: env('SENDGRID_API_KEY'),
        },
        settings: {
          defaultFrom: 'mail@saintsafaris.com',
          defaultReplyTo: 'mail@saintsafaris.com',
        },
      },
    },
  });