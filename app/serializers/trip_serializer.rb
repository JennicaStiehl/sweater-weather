class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
                  :summary,
                  :temperature,
                  :trip_duration,
                  :time_of_forecast

end
