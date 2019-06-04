require 'rails_helper'
RSpec.describe 'As a new user' do
  xit 'can create a new account' do
    post "/api/v1/users?email=whatever@example.com&password=password&password_confirmation='password'&username=jamal"
    # , params = {
    #                           "email": "whatever@example.com",
    #                           "password": "password",
    #                           "password_confirmation": "password"
    #                         }
    data = JSON.generate(User.last)
    expect(response).to be_successful

    get "/api/v1/users?email=whatever@example.com&password=password"
    data = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(data[0].username.include?('jamal')).to eq(true)
    expect(data.include?('js@gmail')).to eq(false)

    # expect(response).to eq("whatever@example.com")
  end
end
