class Api::V1::RoadTripController < ApplicationController
  def show
    start = params[:start]
    trip_end = params[:end]
    service = RoadTripService.new(start,trip_end)
    trip = service.get_trip_info
    origin = LocationCreator.new(trip_end)
    coordinates = WeatherCreator.new(origin.get_location)
    weather = coordinates.get_weather
    hourly_weather = weather.hourly[2]
    render json: {trip_duration: trip.duration,
                        summary: hourly_weather.summary,
                        temperature: hourly_weather.temp,
                        time_of_forecast: hourly_weather.time}
  end
end
