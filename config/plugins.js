module.exports = ({ env }) => ({
  'users-permissions': {
    enabled: true,
    config: {
      jwt: {
        expiresIn: '30d',
      },
    },
  },
  email: {
      config:{
        provider: 'nodemailer',  // Use emailjs for SMTP in Strapi
        providerOptions: {
          host: env('SMTP_HOST', 'smtp.mailgun.org'), // Mailgun SMTP host
          port: env('SMTP_PORT', 587),
          auth: {
              user: env('MAILGUN_USER'), // Your Mailgun SMTP username
              pass: env('MAILGUN_PASS')
          }
        },
        settings: {
          defaultFrom: 'no-reply@saintsafaris.com', // Default 'from' email address
          defaultReplyTo: 'mail@saintsafaris.com', // Default reply-to email address
        },
      }
  },
});
