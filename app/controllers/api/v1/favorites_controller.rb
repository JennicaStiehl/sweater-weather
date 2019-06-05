class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by_api_key(params[:api_key])
    if user
      favorite = Favorite.new(location: params[:location], user_id: user.id)
      favorite.save
      render json:
      {status: "200",
                            body:
                            {
                              "location": favorite.location
                            }}
    else
      render json: {status: "401",
                            body:
                            { "message": "Unauthorized"}}, status: 401
    end
  end

  def index
    user = User.find_by_api_key(params["api_key"])
    if user
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
    else
      render json: {status: "401",
                            body:
                            { "message": "Unauthorized"}}, status: 401
    end
  end

end
