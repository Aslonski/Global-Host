class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @activities = @itinerary.activities
  end

  def edit
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = @itinerary.activity.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = @itinerary.activity.find(params[:id])
  end
end
