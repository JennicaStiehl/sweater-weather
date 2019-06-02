require 'rails_helper'
RSpec.describe Current, type: :model do
  describe 'class methods' do
    it 'can get data' do
      attributes = {
        summary: "sunny",
        icon: "url",
        temperature: "78.3",
        humidity: "12",
        visibility: "none",
        uvIndex: "sf",
        apparent_temperature: "81"
      }
      actual = Current.new(attributes)
      expect(actual.current_summary).to eq(attributes[:summary])
      expect(actual.current_icon).to eq(attributes[:icon])
      expect(actual.current_temp).to eq(attributes[:temperature])
      expect(actual.humidity).to eq(attributes[:humidity])
      expect(actual.visibility).to eq(attributes[:visibility])
      expect(actual.uv_index).to eq(attributes[:uvIndex])
      expect(actual.feels_like).to eq(attributes[:apparent_temperature])
    end
  end
end
