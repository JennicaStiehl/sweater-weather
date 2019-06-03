class AntipodeResults
  attr_reader :id,
                    :weather,
                    :city

  def initialize(weather, city)
    @weather = weather
    @city = city
    @id = 1
  end
end
