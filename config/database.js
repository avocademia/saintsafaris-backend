const path = require('path');


module.exports = ({ env }) => {
  const client = env('DATABASE_CLIENT')
  const isProduction =env('NODE_ENV') === 'production'



  const connections = {
    mysql: {
      connection: {
        connectionString: env('DATABASE_URL'),
        host: isProduction? env('PROD_DATABASE_HOST') : env('DEV_DATABASE_HOST'),
        port: env.int('DATABASE_PORT'),
        database: isProduction? env('PROD_DATABASE_NAME') : env('DEV_DATABASE_NAME'),
        user: isProduction? env('PROD_DATABASE_USERNAME') : env('DEV_DATABASE_USERNAME'),
        password: isProduction?  env('PROD_DATABASE_PASSWORD') : env('DEV_DATABASE_PASSWORD'),
        ssl: env.bool('DATABASE_SSL', false) && {
          key: env('DATABASE_SSL_KEY', undefined),
          cert: env('DATABASE_SSL_CERT', undefined),
          ca: env('DATABASE_SSL_CA', undefined),
          capath: env('DATABASE_SSL_CAPATH', undefined),
          cipher: env('DATABASE_SSL_CIPHER', undefined),
          rejectUnauthorized: env.bool(
            'DATABASE_SSL_REJECT_UNAUTHORIZED',
            true
          ),
        },
      },
      pool: { min: env.int('DATABASE_POOL_MIN', 2), max: env.int('DATABASE_POOL_MAX', 10) },
      migrations: {
        auto: true, // Enable auto-sync for MySQL
      },
    },
  }

  return {
    connection: {
      client,
      ...connections[client],
      acquireConnectionTimeout: env.int('DATABASE_CONNECTION_TIMEOUT', 60000),
    },
  }
}
