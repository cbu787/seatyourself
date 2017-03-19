class SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(params[:email])
    if customer && customer.authenticate(params[:password])
      session[:customer_id] = customer_id
      redirect_to restaurants_url
  end

  def destroy
  end
end
