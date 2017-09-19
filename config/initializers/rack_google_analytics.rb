if ENV['TRACKING_ID']
  Rails.application.config.middleware.use Rack::GoogleAnalytics, tracker: ENV['TRACKING_ID']
end
