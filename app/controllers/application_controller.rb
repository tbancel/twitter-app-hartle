class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include ApplicationHelper
  
  around_filter :catch_exceptions, :if => Proc.new{Rails.env.development?}
  # around_filter :catch_exceptions, :if => Proc.new{Rails.env.production?}
  
  #http_basic_authenticate_with :name => "thomasbancel", :password => "moneymoney"
  
  private
  
    def catch_exceptions
      yield
    rescue => exception
      notify_airbrake(exception)
      ErrorMailer.exception_message(exception).deliver
      puts "OUCCCHHH, that applcation is a mess".red
      puts "\n"
      puts Exception.inspect.red
      add_exception_to_exception_log(exception)
      flash[:error]="Something went wrong. Sorry bro..."
      redirect_to root_path
    end

end
