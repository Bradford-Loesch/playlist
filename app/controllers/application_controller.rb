class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  private
  def require_login
    unless session[:login]
      session[:login] = false
      flash[:error] = "You must be logged in to access this page."
      redirect_to '/main'
    end
  end
end
