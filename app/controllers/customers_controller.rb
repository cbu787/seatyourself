class CustomersController < ApplicationController
  def index
    @customer = Customers.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to restaurants_url
    else
      render :new
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :password, :password_confirmation)
  end
end
