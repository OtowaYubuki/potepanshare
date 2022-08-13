class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end
  
  def show
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:image)
  end

end
