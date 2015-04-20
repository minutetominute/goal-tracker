class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to root_url
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:password, :username)
  end

end
