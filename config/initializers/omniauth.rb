Rails.application.config.middleware.use OmniAuth::Builder do
  issuer = 'https://oidc.login.xyz/'
  client_options = {
    scheme: 'https',
    host: 'oidc.login.xyz',
    port: 443,
    authorization_endpoint: '/authorize',
    token_endpoint: '/token',
    userinfo_endpoint: '/userinfo',
    jwks_uri: '/jwk',
    identifier: Rails.application.credentials[Rails.env.to_sym][:siwe_client_id],
    secret: Rails.application.credentials[Rails.env.to_sym][:siwe_client_secret]
  }

  provider :siwe, issuer: issuer, client_options: client_options
end
