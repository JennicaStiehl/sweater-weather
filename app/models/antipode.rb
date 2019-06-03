class Antipode
  attr_reader :latitude,
                    :longitude,
                    :city

  def initialize(data, city)
    @latitude = data[:data][:attributes][:lat]
    @longitude = data[:data][:attributes][:long]
    @city = city
  end
end
