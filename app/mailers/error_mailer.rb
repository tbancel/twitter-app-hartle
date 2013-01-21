class ErrorMailer < ActionMailer::Base
  default :from => "support@fidbacks.com"
  
  def exception_message(exception, request.env)
    @exception=exception
    @environment=environment
    @controller=
    @backtrace=exception.backtrace
    mail(:to => "thomas.bancel@fidbacks.com", :subject => "Error Raised")
  end
end