class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :check_logged_in
  private
  
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
