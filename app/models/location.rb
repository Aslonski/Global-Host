class Location < ActiveRecord::Base
  has_many :activities
  has_many :itineraries, through: :activities
end
