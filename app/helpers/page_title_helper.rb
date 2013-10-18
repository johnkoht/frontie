module PageTitleHelper

  # Set or append to the page title
  def set_page_title page_title, replace_default_page_title=true
    @page_title = page_title
    @replace_default_page_title = replace_default_page_title
  end

  # Page title
  def page_title options = {}
    app_name = options[:app_name] || Rails.application.class.to_s.split('::').first
    separator = options[:separator] || ' : '

    if @page_title
      # Option to allow users to ignore the rest of the page title
      # and only display the title set in the view
      if @replace_default_page_title
        @page_title
      else
        "#{@page_title} #{separator} #{app_name}"
      end
    else
      app_name
    end
  end


end