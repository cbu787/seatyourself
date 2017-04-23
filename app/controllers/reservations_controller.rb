class ReservationsController < ApplicationController
  before_action :find_restaurant, only: %i(index new create edit update destroy)
  before_action :ensure_logged_in

  def index
    @reservations = @restaurant.reservations
  end

  def new
    @reservation = @restaurant.reservations.build
  end

  def create
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
    if current_user.is_a?(Customer)
      @reservation.customer_id = current_user
    end
    if @reservation.save && current_user.is_a?(Customer)
      redirect_to customer_path(current_user)
    else
      render :new
    end
  end

  def edit
    @reservation = @restaturant.reservation.find(params[:id])
  end

  def update
    @reservation = @restaurant.reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to customer_path(@reservation.customer_id)
    else
      render :edit
    end
  end

  def destroy
    @reservation = @restaurant.reservations.find(params[:id])
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
