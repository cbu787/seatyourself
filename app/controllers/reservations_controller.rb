class ReservationsController < ApplicationController
  before_action :find_restaurant, only: %i(index new create edit update destroy)
  before_action :ensure_logged_in

  def index
    @reservations = @restaurant.reservations.all
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

  def edit
    @reservation = @restaturant.reservation.find(params[:id])
  end

  def update
    @reservation = @restaurant.reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to customer_path(@reservation.customer)
    else
      render :edit
    end
  end

  def destroy
    @reservation - @restaurant.reservation.find(params[:id])
    @reservation.destroy
    redirect_to customer_path(@reservation.customer)
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :time, :party_size)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
