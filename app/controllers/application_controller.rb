class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  private

  def record_not_found
    render :text => "404 Not Found", :status => 404
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

end
