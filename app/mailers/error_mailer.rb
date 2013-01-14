class ErrorMailer < ActionMailer::Base
  default :from => "support@fidbacks.com"
  
  def exception_message(exception)
    @exception=exception
    mail(:to => "thomas.bancel@fidbacks.com", :subject => "Error Raised")
  end
end