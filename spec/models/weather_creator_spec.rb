require 'rails_helper'
RSpec.describe WeatherCreator, type: :model do
  describe 'class methods' do
    it 'can get attributes' do
      attributes = Location.new(city: "denver,co",
                                                latitude: "39.7392358",
                                                longitude: "-104.990251")

      weather_creator = WeatherCreator.new(attributes)

      expect(weather_creator.latitude).to eq(attributes[:latitude])
      expect(weather_creator.longitude).to eq(attributes[:longitude])
    end
    it 'can get the weather' do
      attributes = Location.new(city: "denver,co",
                                                latitude: "39.7392358",
                                                longitude: "-104.990251")

      weather_creator = WeatherCreator.new(attributes)
      weather = weather_creator.get_weather
      expect(weather).to be_an(Object)
    end
  end
end
