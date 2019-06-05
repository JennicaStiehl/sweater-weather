require 'rails_helper'
RSpec.describe 'favorite list' do
  it 'can get a list of favorites and the assoc. weather' do
    user = User.new(email: "whatever@example.com",
                                password: "password",
                                api_key: "hcsajdjashdjsagdhjsa")
    user.save
    user.favorites.create(location:"Golden,co")
    user.favorites.create(location:"Denver,co")

    get '/api/v1/favorites?api_key=hcsajdjashdjsagdhjsa'
    user = User.find_by_email("whatever@example.com")

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)
    expect(results[0][:location]).to eq("Golden,co")
    expect(results[0][:current_weather][:summary]).to eq("Mostly Cloudy")
    expect(results[1][:current_weather][:summary]).to eq("Foggy")

  end
end
