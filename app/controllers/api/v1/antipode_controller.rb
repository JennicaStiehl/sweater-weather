class Api::V1::AntipodeController < ApplicationController
  def show
    location = LocationCreator.new(params[:loc])
    lat_long = WeatherCreator.new(location.get_location)
    antipodeServ = AntipodeService.new(lat_long, location)
    new_lat_long = antipodeServ.get_antipode
    # new_lat_long.get_city_name
    # new_location = LocationCreator.new(new_lat_long)
    # binding.pry
    # coordinates = new_lat_long[:data][:attributes]
    new_weather = WeatherCreator.new(new_lat_long)
    weather_results = new_weather.get_weather

    # binding.pry
    render json: AntipodeSerializer.new(AntipodeResults.new(weather_results, new_lat_long))
  end

end
