module ApplicationHelper

  def flash_class(type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[type.to_sym] || type.to_s
  end

  def css_class_for_controller_action(controller)
    "#{controller.controller_path.parameterize.tr('-', '_')} #{controller.action_name}"
  end

end
