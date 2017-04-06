class CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      session[:customer_id] = @customer.id
      redirect_to customer_path(current_user)
    else
      render :new
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :password, :password_confirmation)
  end
end
