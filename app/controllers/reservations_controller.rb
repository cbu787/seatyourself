class ReservationsController < ApplicationController
  before_action :set_restaurant, only: %i(new create)
  before_action :ensure_logged_in

  def index
  end

  def new
    # @reservation = Reservation.new(params[:restaurant_id])
    @reservation = @restaurant.reservations.build
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.customer = current_user
    if @reservation.save
      redirect_to customers_path(current_user)
    else
      render new
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :time, :party_size)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
