module LinksHelper

  # Simple method to create icon buttons
  def icon_link_to text, path, icon, params = {}
    params[:icon] = icon
    link_to text, path, params
  end

  # Similar to icon_link_to but uses the <button> tag
  def icon_button text, path, icon, params={}
    button = button_tag params do
      icon_link text, icon
    end
  end

  # This actually creates the content within the button including the icons
  def icon_link text, icon
    "#{content_tag(:i, '', :class => "#{icon}")} #{text}".html_safe
  end

end