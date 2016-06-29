class Itinerary < ActiveRecord::Base
  include MapsHelper

  has_many :activities
  has_many :locations, through: :activities

  belongs_to :visitor, class_name: "User"
  belongs_to :host, class_name: "User"

  belongs_to :conversation

  # validates :name, :date, presence: :true

  accepts_nested_attributes_for :activities

  def places_info_finder
    @places_data = []
    idx = 0
    locations.each do |location|
      formatted_address = location.address.split(' ').join('+')
      address_insert = formatted_address + ",+#{location.city}"
      @places_data << get_geocode_info(address_insert)
      @places_data[idx][:loc_name] = location.name
      idx += 1
    end
    @places_data
  end

  def center_lat_lng
    return unless city
    return @center_lat_lng if @center_lat_lng
    @center_lat_lng = get_geocode_info(city)[:loc_lat_lng]
  end

  def city
    host.city if host
  end
end
