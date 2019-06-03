require 'rails_helper'
RSpec.describe 'Amipode API' do
  it 'can get weather for the antipode location' do
    get '/api/v1/antipode?loc=hongkong'
    results = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    binding.pry
    expect(results[:data][:attributes][:weather][:data][:latitude]).to eq(0)
    expect(results[:data][:attributes][:weather][:data][:longitude]).to eq(180)
    # expect(results[:data][:attributes][:current][:current_summary]).to be_a(String)
    # expect(results[:data][:attributes][:current][:current_icon]).to be_a(String)
    # expect(results[:data][:attributes][:current][:humidity]).to be_a(Float)
  end
end

# An antipode is the point on the planet that is diametrically opposite.
#
# You will create an endpoint like so:, `/api/v1/antipode?loc=hongkong`
#
# You will use the `Amypode API` to determine the antipode for Hong Kong.
#
# [`http://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82`]
#
# This is a sample request. Amypode API requires header based authentication. It expects the  `api_key` header to be set to your key, which is `oscar_the_grouch`
#
# Your endpoint will give the user the original city, and the antipode's location name and its current weather summary and current temperature.
#
# To retrieve the antipode's name use something like Google's reverse geocoding documented here: https://developers.google.com/maps/documentation/geocoding/start
#
# You should reuse the code you have currently written for retrieving weather.
#
# Your response should resemble the structure and contain the following data:


# {
#     "data": [
#         {
#             "id": "1",
#             "type": "antipode",
#             "attributes": {
#                 "location_name": "Antipode City Name",
#                 "forecast": {
#                     "summary": "Mostly Cloudy,
#                     "current_temperature": "72",
#                 				},
#             "search_location": "Hong Kong"
#             }
#         }
#     ]
# }
