class AntipodeService
  attr_reader :latitude,
                    :longitude

  def initialize(org_city)
    @latitude = org_city.latitude
    @longitude = org_city.longitude
  end

  def get_antipode
    results = get_json("api/v1/antipodes?#{@lat}&#{@long}")
    # binding.pry
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
