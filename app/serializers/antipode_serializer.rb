class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
                  :weather,
                  :city


end
