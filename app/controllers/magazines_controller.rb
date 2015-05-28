class MagazinesController < ApplicationController


  def new
    @magazine = Magazine.new
  end

  def create
    @magazine = Magazine.new(magazine_params)
    if @magazine.save
      flash[:notice] = "#{@magazine.title} Added"
      redirect_to '/'
    else
      flash[:notice] = "Unable to save. Please fill out all fields."
      render :new
    end
  end

  def show
    @editions = Edition.all
    @magazine = Magazine.find(params[:id])
  end

  def magazine_params
    params.require(:magazine).permit(:title)
  end
end
