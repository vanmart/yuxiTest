class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if resource.has_role? :MasterAdmin
        rails_admin_path
      elsif resource.has_role? :Admin
        #posiblemente a asiganar rutas o a visualizar flota
        #_path
        root_path
      elsif resource.has_role? :RegularUser
        basic_welcome_path
      else
        root_path
      end
    else resource.is_a?(Vehicle)
      root_path
    end
  end

end
