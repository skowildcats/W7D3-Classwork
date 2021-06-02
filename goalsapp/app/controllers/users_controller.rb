class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      flash.now[:message] = "Successfully logged in!"
      render :show
    else
      flash.now[:error] = "Invalid"
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end