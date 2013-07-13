class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_login
    redirect_to root_path, alert: "please login first" if current_user.nil?
  end

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) rescue nil
  end
  helper_method :current_user
  
end
