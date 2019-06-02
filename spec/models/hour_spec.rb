require 'rails_helper'
RSpec.describe Hour, type: :model do
  describe 'class methods' do
    it 'can get attributes' do
      attributes = {
        summary: "snowy",
        temperature: "34",
        time: "157832"
      }
      hour = Hour.new(attributes)
      expect(hour.summary).to eq(attributes[:summary])
      expect(hour.temp).to eq(attributes[:temperature])
      expect(hour.time).to eq(attributes[:time])
    end
  end
end
