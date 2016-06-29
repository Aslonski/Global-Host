class Itinerary < ActiveRecord::Base
  has_many :activities
  has_many :locations, through: :activities

  belongs_to :visitor, class_name: "User"
  belongs_to :host, class_name: "User"

  belongs_to :conversation

  # validates :name, :date, presence: :true

  accepts_nested_attributes_for :activities

  def locations_finder
    @locationJsons = []
    locations.each do |location|
      formatted_address = location.address.split(' ').join('+')

      response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{formatted_address},+#{location.city}&key=#{ENV["GOOGLE_GEOCODE_KEY"]}")
      location_data = JSON.parse(response.body)
      @locationJsons << location_data["results"].first["geometry"]["location"]
    end
    @locationJsons
  end

  def center_lat_lng
    return unless city
    return @center_lat_lng if @center_lat_lng

    # response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{city}&key=#{ENV["GOOGLE_GEOCODE_KEY"]}")
    # location_data = JSON.parse(response.body)
    # @center_lat_lng = location_data["results"].first["geometry"]["location"]
    @center_lat_lng = get_geocode(city)
  end

  def get_geocode(location_info)
    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location_info}&key=#{ENV["GOOGLE_GEOCODE_KEY"]}")
    location_data = JSON.parse(response.body)
    location_data["results"].first["geometry"]["location"]
  end

  def city
    host.city if host
  end
end
