require 'rails_helper'
RSpec.describe 'Favorite endpoint' do
  it 'can add favorites' do
    user = User.new(email: "whatever@example.com", password: "password", api_key: "hcsajdjashdjsagdhjsa")
    user.save
    params = {
        "location": "denver,co",
        "api_key": "hcsajdjashdjsagdhjsa"
                           }
    post '/api/v1/favorites', params: params

    user = User.find_by_email("whatever@example.com")
    #
    # data = JSON.generate(user)
    expect(response).to be_successful
    expect(JSON.parse(response.body)).to eq(
    {"status"=>"200", "body"=>{"location" => "denver,co"}})
  end
  it 'cant add a favorite with the wrong key' do
    user = User.new(email: "whatever@example.com", password: "password", api_key: "hcsajdjashdjsagdhjsa")
    user.save
    params = {
        "location": "denver,co",
        "api_key": "thw9begh98h4539h4"
                           }
    post '/api/v1/favorites', params: params

    user = User.find_by_email("whatever@example.com")
    #
    # data = JSON.generate(user)
    expect(response).to_not be_successful
    expect(JSON.parse(response.body)).to eq(
    {"status"=>"401", "body"=>{"message" => "Unauthorized"}})
  end
end
