class ActivitiesController < ApplicationController

  def create
    @itinerary = Itinerary.find(params[:id])
  end

  def edit
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = @itinerary.activities.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = @itinerary.activities.find(params[:id])

    if @activity.update(activities_params)
      redirect_to itinerary_path(@itinerary)
    else
      render edit_itinerary_activity_path
    end
  end

  private

  def activities_params
    params.require(:activity).permit(:description, location_attributes: [:name, :address, :city])
  end

end
