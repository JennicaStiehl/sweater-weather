class Api::V1::RoadTripController < ApplicationController
  def show
    start = params[:start]
    trip_end = params[:end]
    service = RoadTripService.new(start,trip_end)
    service.get_trip_info
    render json: {}
  end
end
