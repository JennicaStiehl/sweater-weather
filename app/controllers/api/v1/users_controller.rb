class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(email: params[:email], password: params[:password],
                api_key: SecureRandom.hex, username: params[:username])
    if user
      user.save
    else
      "unable to create an account"
    end
  end

  def index
    render json: User.all
  end

end
