class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:username],
      params[:password]
    )

    if @user
      login_user!(@user)
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    current_user.try(:reset_token!)
    session[:session_token] = nil
    redirect_to root_url
  end

end
