Rails.application.config.middleware.use Rack::Tracker do
  handler :google_analytics, { tracker: ENV['TRACKING_ID'] }
end
