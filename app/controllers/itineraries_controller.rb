class ItinerariesController < ApplicationController
  # before_action :find_conversation, only: [:new]

  # def find_conversation
  #   @conversation = Conversation.find(params[:id])
  # end

  def index
    @itineraries = Itinerary.all
  end

  def new

    @itinerary = Itinerary.new
  end

  def create
    @conversation = Conversation.find_by(sender_id: current_user, recipient_id: )
    @itinerary = @conversation.itinerary.new(itinerary_params)
    @itinerary.visitor = current_user
    # @itinerary.host = @conversation.recipient
    if @itinerary.save
      redirect_to itinerary_path(@itinerary)
    else
      @errors = @itinerary.errors.full_messages
      render 'form'
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @activities = @itinerary.activities
  end

  def edit
    @itinerary = Itinerary.find(params[:itinerary_id])
    @itinerary.host =
    @activity = @itinerary.activity.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = @itinerary.activity.find(params[:id])
  end

  private
    def itinerary_params
      params.require(:itinerary).permit(:name, :date)
    end

end
