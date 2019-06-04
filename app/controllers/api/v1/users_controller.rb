class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(email: params[:email], password: params[:password],
                api_key: generate_api_key, username: params[:username])

    if user
      user.save
      render json: {status: "201",
                            body:
                            {
                              "api_key": user.api_key
                            }}
    else
      render json: {message: "unable to create an account"}
    end
  end

  def index
    render json: User.all
  end

  private

  def generate_api_key
    SecureRandom.hex
  end

  def user_params
    params.require(:user).permit(:username, :password, :api_key)
  end

end
