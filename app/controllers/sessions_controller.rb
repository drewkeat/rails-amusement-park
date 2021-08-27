class SessionsController < ApplicationController
  skip_before_action :check_logged_in, only: [:home, :new, :create]

  def home
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(id: params[:user][:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def destroy
  end
end
