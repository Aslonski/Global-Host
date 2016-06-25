class Itinerary < ActiveRecord::Base
  has_many :activities
  has_many :locations, through: :activities

  belongs_to :visitor, class_name: "User"
  belongs_to :host, class_name: "User"

  validates :name, :visitor_id, :host_id, :date, presence: :true
end
