module.exports = ({ env }) => ({
  'users-permissions': {
    enabled: true,
    config: {
      jwt: {
        expiresIn: '30min',
      },
    },
  },
  email: {
      config:{
        provider: 'nodemailer',
        providerOptions: {
          host: env('SMTP_HOST', 'smtp.mailgun.org'),
          port: env('SMTP_PORT', 587),
          auth: {
              user: env('MAILGUN_USER'),
              pass: env('MAILGUN_PASS')
          }
        },
        settings: {
          defaultFrom: 'no-reply@saintsafaris.com',
          defaultReplyTo: 'info@saintsafaris.com',
        },
      }
  },
})
