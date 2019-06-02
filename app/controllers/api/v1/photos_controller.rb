class Api::V1::PhotosController < ApplicationController
  def show
    photo = Photo.new(params[:search])
    render json: PhotoSerializer.new(photo)
  end
end
