class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		flash[:success] = "#{@user.name} is now signed in."
  		sign_in @user
      redirect_to root_path
  	else
  		flash.now[:error] = "Invalid email/password combination."
  		render 'new'
  	end
  end

  def destroy
  	sign_out
    flash[:success] = "You have been signed out."
    redirect_to root_path
  end

end