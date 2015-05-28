class RegistrationsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Thanks for signing in!"
      redirect_to '/'
    else
      flash[:notice] = "No Sign in"
    end
  end
end
