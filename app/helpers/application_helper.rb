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
  
  def add_exception_to_exception_log(exception)
    File.open('log/exception.log', 'w') do |f|
      f << exception.to_s
    end
  end
  
end
