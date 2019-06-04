class Api::V1::FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(location: params[:location], users_id: params[:user_id])
    if favorite
      favorite.save
      user_api_key = User.find(params[:user_id]).api_key
      render json:
      {status: "200",
                            body:
                            {
                              "api_key": user_api_key,
                              "location": favorite.location
                            }}
    else
      render json: {message: "unable to make this lcoation a favorite"}
    end
  end
end
