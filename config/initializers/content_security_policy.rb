# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

 Rails.application.config.content_security_policy do |policy|
   policy.default_src :self
   policy.font_src    :self
   policy.img_src     :self, :https, :data
   policy.object_src  :none
   policy.script_src  :self
   policy.style_src   :self
   policy.frame_src   :self
   # If you are using webpack-dev-server then specify webpack-dev-server host
   policy.connect_src :self, :https, "http://localhost:3035", "ws://localhost:3035" if Rails.env.development?

   # Specify URI for violation reports
   if ENV["CSP_REPORT_URI"]
     policy.report_uri ENV["CSP_REPORT_URI"]
   end
 end

# If you are using UJS then enable automatic nonce generation
# Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }

# Set the nonce only to specific directives
# Rails.application.config.content_security_policy_nonce_directives = %w(script-src)

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
Rails.application.config.content_security_policy_report_only = true
