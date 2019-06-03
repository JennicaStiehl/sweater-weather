class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
                  :hourly,
                  :daily,
                  :current

end
