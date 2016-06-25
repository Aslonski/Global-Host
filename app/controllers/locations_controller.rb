class LocationsController < ApplicationController
  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = Activity.find(params[:activity_id])
    @location = Location.new
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = Activity.find(params[:activity_id])
    @location = Location.new(location_params)
    @activity.location = @location

    if @location.save && @activity.save
      redirect_to itinerary_path(@activity.itinerary)
    else
      @errors = @location.errors.full_messages
      render 'new'
    end
  end

  private
    def location_params
      params.require(:location).permit(:name, :address, :city)
    end
end
