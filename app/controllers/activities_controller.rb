class ActivitiesController < ApplicationController

  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = @itinerary.activities.new
    @location = Location.new
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = @itinerary.activities.new(activities_params)
    # @location = @activity.location.build(activities_params[:location_attributes])

    if @activity.save
      @activity.make_location(params[:activity][:location])
      redirect_to itinerary_path(@itinerary)
    else
      render edit_itinerary_activity_path
    end
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

  def destroy
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to itinerary_path(@itinerary)
  end

  private

  def activities_params
    params.require(:activity).permit(:description, location_attributes: [:name, :address, :city])
  end

end
