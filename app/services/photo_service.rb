class PhotoService
  def initialize(search)
    @search = search
  end

  def get_location_photo
    get_json("/search/photos?query=#{@search}&per_page=1")
  end

  private
    def conn
      Faraday.new("https://api.unsplash.com/") do |f|
        f.adapter Faraday.default_adapter
        f.params[:client_id] = ENV["unsplash_access_key"]
      end
    end

    def get_json(url)
      response = conn.get(url)
      results = JSON.parse(response.body, symbolize_names: true)
      results[:results][0][:urls][:regular]
    end
end
