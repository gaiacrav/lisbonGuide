class PagesController < ApplicationController

  def home
    @spots = Spot.all

    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude
      }
    end
  end




end
