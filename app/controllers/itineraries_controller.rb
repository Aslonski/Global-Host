class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.visitor = current_user
    @itinerary.host =
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @activities = @itinerary.activities
  end

  private
    def itinierary_params
      params.require(:itinerary).permit(:name, :date)
    end
end
