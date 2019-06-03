class AntipodeResults
  attr_reader :id,
                    :weather,
                    :temperature,
                    :city,
                    :icon,
                    :latitude,
                    :longitude

  def initialize(weather, city)
    # binding.pry
    @summary = weather.data[:currently][:summary]
    @weather = weather
    @temperature = weather.data[:currently][:temperature]
    @icon = weather.data[:currently][:icon]
    @city = city.city
    @longitude = city.longitude
    @latitude = city.latitude
    @id = 1
  end
end
