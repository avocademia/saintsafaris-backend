'use strict';

/**
 * refresh-token service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::refresh-token.refresh-token');
