class RoadTrip
  attr_reader :duration,
                    :start,
                    :trip_end
                    
  def initialize(duration, start, trip_end)
    @duration = duration
    @start = start
    @trip_end = trip_end
  end
end
