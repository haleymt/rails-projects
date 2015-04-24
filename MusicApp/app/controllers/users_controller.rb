class UsersController < ApplicationController
  before_action :bands_index, except: [:show, :destroy]

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in!(@user)
      redirect_to user_url(@user)
    else
      redirect_to new_session_url
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

    def user_params
      self.params.require(:user).permit(:email, :password)
    end

  private

    def bands_index
      unless session[:session_token] == nil
        redirect_to bands_url
      end
    end
end
