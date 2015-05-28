class AuthenticationController < ApplicationController

  def new

  end

  def destroy
    session.clear
    flash[:notice] = "Signed out!"
    redirect_to '/'
  end
end
