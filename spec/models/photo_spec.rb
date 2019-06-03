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
    xit 'can get the url' do
      # binding.pry
      photo = Photo.new("denver,co")
      url = photo.url
    end
  end
end
