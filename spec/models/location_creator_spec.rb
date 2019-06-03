require 'rails_helper'
RSpec.describe LocationCreator, type: :model do
  describe 'class methods' do
    it 'can get attributes' do
      attributes = {
        city: "denver,co"
      }
      location_creator = LocationCreator.new(attributes)
      expect(location_creator.city[:city]).to eq(attributes[:city])
    end
    it 'can get the location' do
      location_creator = LocationCreator.new("denver,co")
      location = location_creator.get_location
      expect(location).to be_an(Object)
    end
  end
end
