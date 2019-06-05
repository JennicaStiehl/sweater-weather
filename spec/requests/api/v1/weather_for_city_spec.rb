require 'rails_helper'
RSpec.describe 'Forecast API' do
  it 'can get weather for a specific city' do

    get '/api/v1/forecast?location=denver,co'

    results = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(results[:data][:attributes][:hourly].count).to eq(8)
    expect(results[:data][:attributes][:hourly][0][:summary]).to be_a(String)
    expect(results[:data][:attributes][:hourly][0][:time]).to be_a(Integer)
    expect(results[:data][:attributes][:hourly][0][:temp]).to be

    expect(results[:data][:attributes][:hourly][1][:summary]).to be_a(String)
    expect(results[:data][:attributes][:hourly][1][:time]).to be_a(Integer)
    expect(results[:data][:attributes][:hourly][1][:temp]).to be

    expect(results[:data][:attributes][:daily].count).to eq(7)
    expect(results[:data][:attributes][:daily][0][:icon]).to be_a(String)
    expect(results[:data][:attributes][:daily][0][:precip]).to be_a(Float)

    expect(results[:data][:attributes][:current][:data][:summary]).to be_a(String)
    expect(results[:data][:attributes][:current][:data][:temperature]).to be_a(Float)
    expect(results[:data][:attributes][:current][:data][:uvIndex]).to be_a(Integer)
    expect(results[:data][:attributes][:current][:data][:visibility]).to be_a(Float)
  end
end
