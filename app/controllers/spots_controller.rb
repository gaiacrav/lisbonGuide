class SpotsController < ApplicationController

  def index
    if params[:query].present?
      @spots= Spot.global_search(params[:query])
    else
      @spots = Spot.all
    end
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.save

    if @spot.save
      redirect_to spot_path(@spot)
    else
      render :new
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update(spot_params)

    redirect_to spot_path(@spot)
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

  def spot_params
    params.require(:spot).permit(:name, :description, :photo)
  end

end
