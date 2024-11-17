'use strict';

/**
 * traveller service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::traveller.traveller');
