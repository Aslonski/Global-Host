module MapsHelper

  def get_google_response(location_info)
    HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location_info}&key=#{ENV["GOOGLE_GEOCODE_KEY"]}")
  end

  def parse_response(google_response)
    JSON.parse(google_response.body)
  end

  def get_geocode_info(location_info)
    response = get_google_response(location_info)
    location_data = parse_response(response)
    google_info = {
      loc_lat_lng: location_data["results"].first["geometry"]["location"],
      loc_place_id: location_data["results"].first["place_id"],
      loc_address: location_data["results"].first["formatted_address"]
    }
  end
end
