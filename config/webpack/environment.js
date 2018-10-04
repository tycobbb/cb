const { environment, config } = require('@rails/webpacker')
const { resolve } = require('path')

// add typescript loader
environment.loaders
  .append('typescript', require('./loaders/typescript'))

// add resolve alias for shared code paths
environment.config.merge({
  resolve: {
    alias: {
      '@':  resolve(config.source_path, './app'),
      '@S': resolve(config.source_path, './app/Shared'),
    }
  }
})

module.exports = environment
