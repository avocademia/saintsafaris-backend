'use strict';

/**
 * tour-booking service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::tour-booking.tour-booking');
