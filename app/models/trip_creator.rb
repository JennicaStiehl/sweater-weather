class TripCreator
  def initialize(start, trip_end)
    @start = start
    @trip_end = trip_end
  end

  def get_road_trip_info
    service = RoadTripService.new(@start,@trip_end)
    trip = service.get_trip_info
  end

  def get_weather_info
    origin = LocationCreator.new(@trip_end)
    coordinates = WeatherCreator.new(origin.get_location)
    weather = coordinates.get_weather
    hourly_weather = weather.hourly[2]
  end

  def results
    trip = get_road_trip_info
    hourly_weather = get_weather_info
    attributes = {id: 1,
                        trip_duration: trip.duration,
                        summary: hourly_weather.summary,
                        temperature: hourly_weather.temp,
                        time_of_forecast: hourly_weather.time}
    Trip.new(attributes)
  end

end
