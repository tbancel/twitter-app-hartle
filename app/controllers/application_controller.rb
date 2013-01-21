class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include ApplicationHelper
  
  # around_filter :catch_exceptions, :if => Proc.new{Rails.env.development?}
  around_filter :catch_exceptions, :if => Proc.new{Rails.env.production?}
  
  #http_basic_authenticate_with :name => "thomasbancel", :password => "moneymoney"
  
  private
  
    def catch_exceptions
      yield
    rescue Exception => exception
      # Does not work yet
      notify_airbrake(exception)
      # Airbrake.notify(exception)
  
      time=Time.now
      backtrace=Rails.backtrace_cleaner.send(:filter, exception.backtrace)
      request=ActionDispatch::Request.new(env)
      controller=env['action_controller.instance']||MissingController.new
      
      log_exception(time, env, request, controller, exception, backtrace)
      flash[:error]="Something went wrong. Sorry bro..."
      redirect_to root_path # WARNING: JAMAIS D'ERREUR DANS LE ROOT PATH
      
      # Idem
      # ErrorMailer.exception_message(exception).deliver
      
      # # Introduction message
      # puts "OUCCCHHH, that applcation is a mess".yellow
      # puts "\n"
      # 
      # # Understanding Rack : env
      # puts "Rack env (the request) : #{env.class.inspect}".red
      # puts "\n"
      # puts "Keys and values".red
      # env.keys.each do |key|
      #   puts "#{key} => #{request.env[key]}".red
      # end
      # puts "\n"
      
      # puts env["rack.errors"].inspect.blue
      # puts env["action_controller.instance"].inspect.blue
      # puts "\n"
      
      # Understanding Rack : app => Nothing
      # puts app.class.inspect.red
      
      # Does it do something?
      # puts exception.inspect.yellow
      # puts exception.class.inspect.yellow
      # puts exception.backtrace.first.yellow
      # 
      # backtrace=Rails.backtrace_cleaner.send(:filter, exception.backtrace)
      # 
      # puts "#{backtrace.first.inspect}".yellow
      # puts "\n"
      # puts backtrace.join("\n").yellow
      
      # puts exception.message.inspect.red
      # You can't call message on Exception
      # puts Exception.message.inspect.red
      # puts "\n"
      
      # Only puts development
      # puts Rails.env.inspect.green
      # puts Rails.env.class.inspect.green
      # puts "\n"
      
      # Understanding request.env (similar to Rack env)
      # puts "Request class : #{request.env.class.inspect}".blue
      # puts "\n"
      # puts "Response class : #{response.class.inspect}".blue
      # puts response.message.inspect.green
      # puts response.status.inspect.green
      # puts response.headers.inspect.green
      # puts response.body.inspect.green
      # puts "\n"
          
      # request.env.keys.each do |key|
      #   puts "#{key} => #{request.env[key]}".blue
      #   puts "\n"
      # end
    end
end
