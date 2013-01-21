Airbrake.configure do |config|
  config.api_key = ENV['AIRBRAKE_API_KEY']
  
  # config.logger=Logger.new("/log/exception.log")
end
