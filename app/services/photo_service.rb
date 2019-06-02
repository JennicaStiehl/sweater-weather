class PhotoService
  def initialize(search)
    @search = search
  end

  def get_location_photo
    get_json("/search/photos?client_id=#{ENV["unsplash_access_key"]}&query=#{@search}&per_page=1")
    # get_json("flickr.photos.getRecent/rest/method=flickr.photos.search&api_key=#{ENV["Flickr_Key"]}&tags=#{@search}")
  end

  private
    def conn
      # Faraday.new("https://www.flickr.com/") do |f|
      Faraday.new("https://api.unsplash.com/") do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def get_json(url)
      response = conn.get(url)
      results = JSON.parse(response.body, symbolize_names: true)
      results[:results][0][:urls][:regular]
    end
end
