class WeatherCreator
  def initialize(data)
    @latitude = data.latitude
    @longitude = data.longitude
  end

  def get_weather
    response = Faraday.get("https://api.darksky.net/forecast/a95c0a369697d8799cfc228fc67a908b/#{@latitude},#{@longitude}")
    results = JSON.parse(response.body, symbolize_names: true)
    Weather.new(results)
  end

end
