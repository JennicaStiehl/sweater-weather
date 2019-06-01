class LocationCreator
  def initialize(data)
    @city = data
  end

  def get_location
    location = Location.find_by_city(@city)
    if location
      return location
    else
      response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@city}&key=AIzaSyCvF_7cuGe48Qj6KEtFwCZOi1hRY5v3cBA")
      results = JSON.parse(response.body, symbolize_names: true)
      latitude = results[:results][0][:geometry][:location][:lat]
      longitude = results[:results][0][:geometry][:location][:lng]
      Location.create(city: @city, latitude: latitude, longitude: longitude)
    end

  end
end
