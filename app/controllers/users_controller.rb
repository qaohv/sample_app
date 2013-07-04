class UsersController < ApplicationController

  def new
  end

  private
  
  def app_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
