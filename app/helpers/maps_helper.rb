module MapsHelper

  # Refactor to share HTTParty and JSON methods

  def get_geocode_info(location_info)
    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location_info}&key=#{ENV["GOOGLE_GEOCODE_KEY"]}")
    location_data = JSON.parse(response.body)
    g_info = {
      loc_lat_lng: location_data["results"].first["geometry"]["location"],
      loc_place_id: location_data["results"].first["place_id"],
      loc_address: location_data["results"].first["formatted_address"]
    }
  end

  def get_place_info(location_info)
    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location_info}&key=#{ENV["GOOGLE_GEOCODE_KEY"]}")
    location_data = JSON.parse(response.body)
    location_data["results"].first["place_id"]
  end
end
