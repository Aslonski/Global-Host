class Location < ActiveRecord::Base
  has_many :activities
  has_many :itineraries, through: :activities
  has_many :travelers, through: :itineraries, source: "User"
end
