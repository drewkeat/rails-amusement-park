class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :check_logged_in
  layout :determine_layout

private
  def determine_layout
    current_user ? "users" : "application"
  end
  
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in
    !!current_user
  end

  def check_logged_in
    if !logged_in
      redirect_to root_path
    end
  end

end
