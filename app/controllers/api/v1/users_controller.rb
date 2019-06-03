class Api::V1::UsersController < ApplicationController

  def create
    binding.pry
    User.new(email: params[:email], password: params[:email])
  end
end
