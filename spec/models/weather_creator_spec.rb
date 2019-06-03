require 'rails_helper'
RSpec.describe WeatherCreator, type: :model do
  describe 'class methods' do
    xit 'can get attributes' do
      attributes = {
        latitude: "92",
        longitude: "-142"
      }
      weather_creator = WeatherCreator.new(attributes)
      expect(weather_creator.latitude[:latitude]).to eq(attributes[:latitude])
      expect(weather_creator.longitude[:longitude]).to eq(attributes[:longitude])
    end
    xit 'can get the weather' do
      weather_creator = WeatherCreator.new("denver,co")
      weather = weather_creator.get_weather
      expect(weather).to be_an(Object)
    end
  end
end
