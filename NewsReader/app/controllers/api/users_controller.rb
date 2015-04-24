class Api::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save!
    render json: user
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
