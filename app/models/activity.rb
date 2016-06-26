class Activity < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :location

  validates :description, :itinerary_id, presence: :true

  accepts_nested_attributes_for :location
end
