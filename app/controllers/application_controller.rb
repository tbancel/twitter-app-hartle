class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  #http_basic_authenticate_with :name => "thomasbancel", :password => "moneymoney"
end
