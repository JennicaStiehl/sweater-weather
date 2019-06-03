class CityService
  def initialize(lat,lng)
    @lat = lat
    @long  = lng
  end

  def get_city_name
    results = get_json("api/geocode/json?latlng=#{@lat},#{@long}")
  end

private
  def conn
    Faraday.new("https://maps.googleapis.com/maps/") do |f|
      f.params[:key] = ENV["Google_API_Key"]
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
