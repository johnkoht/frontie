module ActiveStateHelper

  # return 'active' if the current controller action matches the provided action_name
  def active_for action_name
    params[:action].to_s == action_name.to_s ? 'active' : ''
  end

  # return 'active' if the current controller name matches the provided controller_name
  def active_for_controller controller_name
    params[:controller].to_s == controller_name.to_s ? 'active' : ''
  end

  # return 'active' if the current controller and action name matches the provided controller_name and action_name
  def active_for_controller_and_action controller_name, action_name
    params[:controller].to_s == controller_name.to_s && params[:action].to_s == action_name.to_s ? 'active' : ''
  end
  
  # return 'active' for an array of controllers, i.e. blog, categories, tags, etc.
  def active_for_controllers controller_array
    (controller_array.include? params[:controller].to_s) ? 'active' : ''
  end

end