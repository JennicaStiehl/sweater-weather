class LocationCreator
  def initialize(data)
    @city = data
  end

  def get_location
    location = Location.find_by_city(@city)
    if location
      return location
    else
      geocode = GeocodeService.new
      data = geocode.get_coordinates(@city)
      Location.create(data)
    end
  end

end
