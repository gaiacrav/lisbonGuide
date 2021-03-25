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
  end

  def destroy
  end
end
