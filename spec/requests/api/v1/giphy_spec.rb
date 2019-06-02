require 'rails_helper'
RSpec.describe 'Giphy API' do
  it 'can find a snowy gif' do
    get '/api/v1/gifs?location=denver,co'
    results = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
  end
end
