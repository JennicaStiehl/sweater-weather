class Photo
  attr_reader :id
  
  def initialize(data)
    @id = 1
    @location = data
  end

  def url
    service = PhotoService.new(@location)
    service.get_location_photo
  end
end
