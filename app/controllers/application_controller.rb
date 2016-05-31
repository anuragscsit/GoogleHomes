class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  helper_method :account_url
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :contact_number,  :referrer)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password, :first_name, :last_name, :contact_number,  :referrer) }
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def account_url
  	case resource.class.name
  	when 'HouseOwner'
  		 dashboard_owner_house_owners_path
  	when 'Tenant'
  		dashboard_tenant_tenants_path

  	else
  		root_url
  	end
  end

  def after_sign_in_path_for(resource)
  	account_url
  end

  %w(HouseOwner Tenant).each do |k|
    define_method "current_#{k.underscore}" do
      current_user if current_user.is_a?(k.constantize)
    end

    define_method "authenticate_#{k.underscore}!" do |opts={}|
      if current_user.is_a?(k.constantize)
        return true
      else
        flash[:notice] = "You are not able to access this page"
        redirect_to root_path
      end
    end
  end
  
  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
