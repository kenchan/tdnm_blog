require Rails.root.join('lib/rack/hatena_star')

Rails.application.config.middleware.use(
  Rack::HatenaStar,
  token: '64ec46b14d3213944171cf6c8966b68e2a0a46dd',
  entry_nodes: {
    article: {
      uri: 'h2 a',
      title: 'h2',
      container: 'h2'
    }
  }
)
