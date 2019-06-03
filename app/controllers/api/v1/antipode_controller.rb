class Api::V1::AntipodeController < ApplicationController
  def show
    location = LocationCreator.new(params[:loc])
    weather = WeatherCreator.new(location.get_location)
    # render json: ForecastSerializer.new(weather.get_weather)
    binding.pry
    render json: AntipodeSerializer.new(antipode.new)
  end

end
