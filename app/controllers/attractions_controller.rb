class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
  end

  def create
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
