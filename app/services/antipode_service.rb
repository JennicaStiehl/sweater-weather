class AntipodeService
  attr_reader :latitude,
                    :longitude,
                    :city

  def initialize(org_city_obj, city_name)
    # binding.pry
    @latitude = org_city_obj.latitude
    @longitude = org_city_obj.longitude
    @city = city_name
  end

  def get_antipode
    results = get_json("api/v1/antipodes?#{@latitude}&#{@longitude}")
    cityServ = CityService.new(results[:data][:attributes][:lat],results[:data][:attributes][:long])
    city_results = cityServ.get_city_name
    city = city_results[:results][0][:address_components][0][:long_name]
    antipode = Antipode.new(results, city)
    # org_city_obj = GeocodeService.new(@city)
  end

  private

  def conn
    Faraday.new("http://amypode.herokuapp.com/") do |f|
      f.headers[:api_key] = "oscar_the_grouch"
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
