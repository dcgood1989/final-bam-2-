class WelcomeController < ApplicationController

  def index
    @magazines = Magazine.all
    @users = User.all
  end
end
