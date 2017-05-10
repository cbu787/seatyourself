class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: %i(show edit update destroy)
  before_action :ensure_logged_in, only: %i(new create)

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reservation = @restaurant.reservations.build
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner = current_user
    if @restaurant.save
      redirect_to owner_path(current_user)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @restaurant.update_attributes(restaurant_params)
      redirect_to owner_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :capacity, :owner_id, :description, :phone_number, :open_time, :close_time, :price, :address)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
