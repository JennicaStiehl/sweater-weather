class AntipodeResults
  attr_reader :id,
                    :temperature,
                    :city,
                    :icon,
                    :latitude,
                    :longitude,
                    :weather

  def initialize(weather, city)
    # binding.pry
    @summary = weather.data[:currently][:summary]
    @temperature = weather.data[:currently][:temperature]
    @icon = weather.data[:currently][:icon]
    @city = city.city
    @longitude = city.longitude
    @latitude = city.latitude
    @weather = weather
    @id = 1
  end
end
