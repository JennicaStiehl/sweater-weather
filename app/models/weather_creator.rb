class WeatherCreator
  attr_reader :latitude,
                    :longitude

  def initialize(data)
    @latitude = data.latitude
    @longitude = data.longitude
  end

  def get_weather
    Weather.new(results)
  end

  private
  def service
    @_service ||= WeatherService.new
  end

  def results
    @_results ||= service.get_forecast(@latitude, @longitude)
  end

end
