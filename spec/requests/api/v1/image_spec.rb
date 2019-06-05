require 'rails_helper'
RSpec.describe 'Image API' do
  it 'can search for a location related photo' do
    get '/api/v1/photo?search=denver,co'
    results = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(results).to be_a(Hash)
    expect(results[:data][:attributes][:url]).to be_a(String)
    expect(results[:data][:attributes][:url]).to start_with("https://images.unsplash.com/")
  end
end
