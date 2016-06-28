class Itinerary < ActiveRecord::Base
  has_many :activities
  has_many :locations, through: :activities

  belongs_to :visitor, class_name: "User"
  belongs_to :host, class_name: "User"

  belongs_to :conversation

  # validates :name, :date, presence: :true

  accepts_nested_attributes_for :activities
end
