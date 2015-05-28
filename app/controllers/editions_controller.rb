class EditionsController < ApplicationController

  def new
    @edition = Edition.new
  end

  def create
    @edition = Edition.new(edition_params)
    if @edition.save
      flash[:notice] = "New Edition For National Geographic Saved"
      redirect_to edition_path(@edition)
    else
      flash[:notice] = "Unable to save. Please fill out all fields"
      render :new
    end
  end

  def show
    @edition = Edition.find(params[:id])
  end

  def edit
    @edition = Edition.find(params[:id])
  end

  def update
    @edition = Edition.find(params[:id])
    if @edition.update(edition_params)
      flash[:notice] = "Edition For PC Gamer Saved"
      redirect_to edition_path(@edition)
    else
      render :edit
    end
  end

  def edition_params
    params.require(:edition).permit(:edition, :issue, :date, :magazine_id)
  end
end
