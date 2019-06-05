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
      render json: {status: "401",
                            body:
                            { "message": "Unauthorized"}}
    end
  end

  def index
    user = User.find_by_api_key(params["api_key"])
    results = user.favorites.map do |favorite|
      data = Hash.new(0)
      location = LocationCreator.new(favorite.location).get_location
      weather = WeatherCreator.new(location).get_weather

      data = {location: location.city,
                  current_weather:  {summary:  weather.data[:currently][:summary],
                                                temperature: weather.data[:currently][:temperature]
                                                }
                  }
      end
    render json: results
  end

end
