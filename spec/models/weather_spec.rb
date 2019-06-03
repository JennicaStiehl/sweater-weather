require 'rails_helper'
RSpec.describe Weather, type: :model do
  before :each do
    @location = Location.new(city: "denver,co",
      latitude: "39.7392358",
      longitude: "-104.990251")

      @weather_creator = WeatherCreator.new(@location)
      @weather = @weather_creator.get_weather
  end
  describe 'class methods' do
    it 'can get attributes' do
      expect(@weather.data).to be_a(Hash)
    end
    it 'can get the hourly weather' do
      hourly_weather = @weather.hourly
      expect(hourly_weather[0].summary).to be_a(String)
      expect(hourly_weather[0].temp).to be_a(Float)
    end
    it 'can get the daily weather' do
      daily_weather = @weather.daily
      expect(daily_weather[0].icon).to be_a(String)
      # expect(daily_weather[0].low).to be_a(Float)
      expect(daily_weather[0].high).to be_a(Float)
      expect(daily_weather[0].precip).to be_a(Float)
    end
    it 'can get the current weather' do
      current_weather = @weather.current
      expect(current_weather.current_temp).to be_a(Float)
      expect(current_weather.current_summary).to be_a(String)
      expect(current_weather.current_icon).to be_a(String)
      expect(current_weather.humidity).to be_a(Float)
      expect(current_weather.uv_index).to be_a(Integer)
    end
  end
end
