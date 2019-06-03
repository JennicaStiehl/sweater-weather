require 'rails_helper'
RSpec.describe Day, type: :model do
  describe 'class methods' do
    it 'can get attributes' do
      attributes = {
        icon: "snowy",
        temperatureHigh: "34",
        temperatureLow: "14",
        precipProbability: "24"
      }
      day = Day.new(attributes)
      expect(day.icon).to eq(attributes[:icon])
      expect(day.high).to eq(attributes[:temperatureHigh])
      expect(day.low).to eq(attributes[:temperatureLow])
      expect(day.precip).to eq(attributes[:precipProbability])
    end
  end
end
