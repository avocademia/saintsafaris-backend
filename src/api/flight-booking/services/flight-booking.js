'use strict';

/**
 * flight-booking service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::flight-booking.flight-booking');
