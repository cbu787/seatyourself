class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  def current_user
    if session[:customer_id]
      @current_user ||= Customer.find(session[:customer_id])
    elsif session[:owner_id]
      @current_user ||= Owner.find(session[:owner_id])
    end
  end

  def ensure_logged_in
    unless current_user
      redirect_to new_session_path
    end
  end
end
