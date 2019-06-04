class Api::V1::RoadTripController < ApplicationController
  def show
    attributes = {params[:start],params[:end]}
    service = RoadTripService.new(attributes)

    # trip = new_trip.get_trip_info
    render json: {}
  end
end
