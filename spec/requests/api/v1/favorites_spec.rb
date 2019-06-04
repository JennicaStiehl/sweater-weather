require 'rails_helper'
RSpec.describe 'Favorite endpoint' do
  it 'can add favorites' do
    user = User.new(email: "whatever@example.com", password: "password", api_key: "hcsajdjashdjsagdhjsa")
    user.save
    params = {
        "location": "denver,co",
        "api_key": "jgn983hy48thw9begh98h4539h4",
        "user_id": "#{user.id}"
                           }
    post '/api/v1/favorites', params: params

    user = User.find_by_email("whatever@example.com")
    #
    # data = JSON.generate(user)
    expect(response).to be_successful
    expect(JSON.parse(response.body)).to eq(
    {"status"=>"200", "body"=>{"location" => "denver,co", "api_key" => "#{user.api_key}"}})
  end
end
