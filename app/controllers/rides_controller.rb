class RidesController < ApplicationController
  def create
    ride = Ride.new(attraction_id: params[:attraction_id], user_id: params[:user_id])
    if ride.take_ride == true
      flash.notice = "Thanks for riding the #{Attraction.find(ride.attraction_id).name}!"
      redirect_to user_path(current_user)
    else
      flash.notice = "#{ride.take_ride}" 
      redirect_to user_path(current_user)
    end
  end
end
