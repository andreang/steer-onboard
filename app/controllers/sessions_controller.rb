class SessionsController < ApplicationController
	def new
	end

	def create
	username = params[:session][:username]
	password = params[:session][:username]
	@user = User.find_by(username: username)

	if @user.present? and @user.authenticate(password)
	flash[:success] = "Hi #{@user.username}!"
	reset_session
	session[:user_id] = @user.id
	redirect_to root_path
	else
		render :new
		flash[:error] = "Maybe we aren't friends yet."
	end
	end	

	def destroy
		reset_session
		session[:user_id] = nil
		flash[:success] = "Get lost."
		redirect_to root_path
	end

end
