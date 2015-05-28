class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for signing up!"
      redirect_to '/'
    else
      flash[:notice] = "That sucks"
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
