class Trip
  attr_reader :id,
                    :summary,
                    :temperature,
                    :trip_duration,
                    :time_of_forecast

  def initialize(attributes)
    @id = attributes[:id]
    @summary = attributes[:summary]
    @temperature = attributes[:temperature]
    @trip_duration = attributes[:trip_duration]
    @time_of_forecast = attributes[:time_of_forecast]
  end
end
