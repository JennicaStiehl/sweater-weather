class Api::V1::AntipodeController < ApplicationController
  def show
    location = LocationCreator.new(params[:loc])
    lat_long = WeatherCreator.new(location.get_location)
    antipodeServ = AntipodeService.new(lat_long)
    new_lat_long = antipodeServ.get_antipode
    new_weather = WeatherCreator.new(new_lat_long)
    render json: AntipodeSerializer.new(new_weather.get_weather)
  end

end
