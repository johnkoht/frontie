module BodyClassHelper

  # Set additional body classes from the view
  def set_body_class body_classes
    @body_classes = body_classes
  end

  # Get the body classes based on the controller and actions
  def body_class
    qualified_controller_name = controller.controller_path.gsub('/','-')
    basic_body_class = "#{qualified_controller_name} #{qualified_controller_name}-#{controller.action_name}"

    if @body_classes
      "#{basic_body_class} #{@body_classes}"
    else
      basic_body_class
    end
  end

end