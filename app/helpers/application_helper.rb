module ApplicationHelper
  
  # Returns the full title on a per-page basis
  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def log_exception(time, env, request, controller, exception, backtrace)
    File.open('log/exception.log', 'a+') do |f|
      f << "\n"
      f << "At #{time.inspect}\n"
      f << "A #{exception.class.inspect} occured in #{controller.controller_name.inspect}##{controller.action_name.inspect}\n"
      f << "#{backtrace.first.inspect}\n"
      f << "#{exception.message.inspect}\n"
      f << "\n"
    end
  end
end
