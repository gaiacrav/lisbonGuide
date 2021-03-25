class SpotsController < ApplicationController

  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_name)
    @spot.save

    if @spot.save
      redirect_to spot_path(@spot)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def spot_name
    params.require(:spot).permit(:name, :photo)
  end

end
