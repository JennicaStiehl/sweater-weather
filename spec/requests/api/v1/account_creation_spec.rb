require 'rails_helper'
RSpec.describe 'As a new user' do
  it 'can create a new account' do
    post "/api/v1/users?email='whatever@example.com'&password='password'&password_confirmation='password'"
    # , params = {
    #                           "email": "whatever@example.com",
    #                           "password": "password",
    #                           "password_confirmation": "password"
    #                         }
    data = JSON.generate(params)
    expect(response).to be_successful
  end
end
