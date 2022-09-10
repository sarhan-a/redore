class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_breadcrumbs

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name avatar])
  end
  def default_url_options
    { host: ENV["www.redore.co.uk"] || "localhost:3000" }
  end

  def add_breadcrumb(label, path = nil, current = false)
    @breadcrumbs << {
      label: label,
      path: path,
      current: current
    }
  end

  def set_breadcrumbs
    @breadcrumbs = []
  end
end
