class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {status: "200",
                            body:
                            {
                              "api_key": user.api_key
                            }}
    else
      render json: {message: "unable to login"}
    end
  end
end
