class Api::V1::ForecastController < ApplicationController
  def show
    location = LocationCreator.new(params[:location])
    weather = WeatherCreator.new(location.get_location)
    render json: ForecastSerializer.new(weather.get_weather)
  end

end
