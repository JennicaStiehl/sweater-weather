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

    expect(response).to be_successful
    expect(JSON.parse(response.body)).to eq(
    {"status"=>"201", "body"=>{"api_key"=>"#{user.api_key}"}})
  end
  it 'can receives an error when passwords dont match' do
     params = {
                              "email": "whatever@example.com",
                              "password": "password",
                              "password_confirmation": " "

                            }
    post '/api/v1/users', params: params
    user = User.last
    data = JSON.generate(user)

    expect(JSON.parse(response.body)).to eq(
    {"status"=>"406", "body"=>{"message"=>"Unable to create account"}})
  end
end
