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
      expect(url).to eq("https://images.unsplash.com/photo-1558539158-5ba5d234f3b3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjc0NzcyfQ")
    end
  end
end
