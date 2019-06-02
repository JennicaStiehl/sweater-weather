class GeocodeService

  def get_coordinates(city)
    data = Hash.new(0)
    results = get_json("maps/api/geocode/json?address=#{city}")
    data[:latitude] = results[:results][0][:geometry][:location][:lat]
    data[:longitude] = results[:results][0][:geometry][:location][:lng]
    data[:city] = city
    data
  end

  private
  def conn
    Faraday.new("https://maps.googleapis.com") do |f|
      f.params[:key] = ENV["Google_API_Key"]
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
