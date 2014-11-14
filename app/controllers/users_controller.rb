class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to root_path
  		flash[:success] = "Good job."
  	else
  		render :new
  		flash[:error] = "You suck."
  	end
  end

  def edit
  end

  private
  def user_params
  	params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
