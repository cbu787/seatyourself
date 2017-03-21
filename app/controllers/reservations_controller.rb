class ReservationsController < ApplicationController
  def index
  end

  def new
    @reservation = Reservation.new(params[:restaurant_id])
    @reservation = @restaurant.reservations.build
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.customer = current_user
    if @reservation.save
      redirect_to root_url
    else
      render new
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :time, :party_size)
  end
end
