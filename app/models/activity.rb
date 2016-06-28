class Activity < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :location

  validates :description, :itinerary_id, presence: :true

  accepts_nested_attributes_for :location

  # after_save :make_location, only: :new

  def make_location(params)
    new_location = Location.create(name: params[:name], address: params[:address], city: params[:city])
    self.update(location_id: new_location.id)
  end

end
