class ApplicationController < ActionController::Base

   before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resources)

    case resource
    when Customer
      root_path
    when Admin
      admin_root_path
    end

  end


  def after_sign_out_path_for(resources)
    case resource
    when Customer
      root_path
    when Admin
    admin_session_path

  end

 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name,
    :first_name_kana, :last_name_kana, :email, :address, :postal_code, :telephone_number])
  end

end
