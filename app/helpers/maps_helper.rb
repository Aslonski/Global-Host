module MapsHelper
  def get_geocode(location_info)
    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location_info}&key=#{ENV["GOOGLE_GEOCODE_KEY"]}")
    location_data = JSON.parse(response.body)
    location_data["results"].first["geometry"]["location"]
  end
end
