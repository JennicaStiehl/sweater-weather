require 'rails_helper'
RSpec.describe Photo, type: :model do
  describe 'class methods' do
    it 'can get attributes' do
      attributes = {
        id: 1,
        location: "denver,co"
      }
      photo = Photo.new(attributes)
      expect(photo.id).to eq(attributes[:id])
      expect(photo.location[:location]).to eq(attributes[:location])
    end
    it 'can get the url' do
      photo = Photo.new("denver,co")
      url = photo.url
      expect(url).to start_with("https://images.unsplash.com/")
    end
  end
end
