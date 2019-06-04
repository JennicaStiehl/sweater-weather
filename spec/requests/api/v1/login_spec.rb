require 'rails_helper'
RSpec.describe 'ua a user' do
  it ' can login' do
    user = User.create(email: "whatever@example.com", password: "password")

    params = {
                             "email": "whatever@example.com",
                             "password": "password",
                             "password_confirmation": "password"
                           }

    post '/api/v1/sessions', params: params
    user = User.find_by_email("whatever@example.com")
    binding.pry
    data = JSON.generate(user)
    expect(response).to be_successful
    expect(JSON.parse(response.body)).to eq(
    {"status"=>"200", "body"=>{"api_key"=>"#{user.api_key}"}})
  end
end
