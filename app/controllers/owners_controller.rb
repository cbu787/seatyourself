class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      session[:owner_id] = @owner.id
      redirect_to owner_path(current_user)
    else
      render :new
    end
  end

  private
  def owner_params
    params.require(:owner).permit(:email, :password, :password_confirmation)
  end
end
