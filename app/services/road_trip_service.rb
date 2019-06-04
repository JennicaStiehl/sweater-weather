class RoadTripService
  def initialize(start,trip_end)
    @start = start
    @trip_end  =  trip_end
  end

  def get_trip_info
    response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{@start}&destination=#{@trip_end}&key=#{ENV["Google_API_Key"]}")
    trip_info = JSON.parse(response.body, symbolize_names: true)
    duration = trip_info[:routes][0][:legs][0][:duration][:text]
    binding.pry
  end
end
