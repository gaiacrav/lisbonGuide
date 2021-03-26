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
    @spot = Spot.find(params[:id])

    if @spot.destroy
      redirect_to spots_path(@spot), notice: 'You successfully deleted the spot!'
    else
      redirect_to spot_path(@spot), alert: 'Could not delete the spot :('
    end

  end

  private

  def spot_name
    params.require(:spot).permit(:name, :photo)
  end

end
