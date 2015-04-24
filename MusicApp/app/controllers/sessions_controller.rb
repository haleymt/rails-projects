class SessionsController < ApplicationController
  before_action :bands_index, except: [:destroy]
#  before_action :must_be_logged_in, except: [:create]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user.nil?
      render :new
    else
      log_in!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    @user = current_user
    @user.reset_session_token!
    log_out!
    redirect_to new_session_url
  end

  protected

    def must_be_logged_in
      if current_user.nil?
        redirect_to new_session_url
      end
    end

  private

    def bands_index
      if current_user
        redirect_to bands_url
      end
    end

end
