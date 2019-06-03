class AntipodeService
  attr_reader :city

  def initialize(org_city)
    @city = org_city.city
    @lat = org_city.latitude
    @long = org_city.longitude
  end

  def get_antipode(org_city)
    binding.pry
    results = get_json("api/v1/antipodes?#{@lat}&#{@long}")
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
    response = copnn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
