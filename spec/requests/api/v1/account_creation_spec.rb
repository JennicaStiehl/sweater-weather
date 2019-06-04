require 'rails_helper'
RSpec.describe 'As a new user' do
  it 'can create a new account' do
     params = {
                              "email": "whatever@example.com",
                              "password": "password",
                              "password_confirmation": "password"

                            }
    post '/api/v1/users', params: params
    user = User.last
    data = JSON.generate(user)
    binding.pry
    expect(response).to be_successful
    expect(JSON.parse(response.body)).to eq(
    {"status"=>"201", "body"=>{"api_key"=>"#{user.api_key}"}})
    # get "/api/v1/users?email=whatever@example.com&password=password"
    # data = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    # expect(data[0].username.include?('jamal')).to eq(true)
    # expect(data.include?('js@gmail')).to eq(false)

    # expect(response).to eq("whatever@example.com")
  end
end
