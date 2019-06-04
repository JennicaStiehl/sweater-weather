require 'rails_helper'
# The object of this assessment is to create an API endpoint to assist in the planning of road trips.
RSpec.describe 'Road Trip API' do
  it 'can create an endpoint' do
    get '/api/v1/road_trip?start=denver,co&end=pueblo,co'

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)
    expect(results).to have_keys(:trip_duration)
    expect(results).to have_keys(:summary)
    expect(results).to have_keys(:temperature)
    expect(results).to have_keys(:precip)
  end
end


# You will use the Google Directions API:  https://developers.google.com/maps/documentation/directions/start
# in order to find out how long it will take to travel from the two locations, and then deliver the weather forecast for the hour
# of arrival.
#https://maps.googleapis.com/maps/api/directions/json?origin=Denver&destination=Pueblo&key=AIzaSyBE6czLmRxervXnUX6IiaKDCtiINn2EmzQ
# For example, Denver to Pueblo would take two hours. You will deliver a forecast two hours in the future that includes the temperature and summary.