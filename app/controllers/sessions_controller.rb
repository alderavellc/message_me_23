class SessionsController < ApplicationController 
  before_action :logged_in_redirect, only: [:new, :create]

  def new
    
  end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			p "all good"
			session[:user_id] = user.id
			flash[:success] = "Welcome, #{user.email}."
			redirect_to root_path
		else
			p "no good"
			flash.now[:error] = "Your login information is incorrect. Please try again."
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have successfully logged out."
		redirect_to login_path
	end

  private 

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in."
      redirect_to root_path
    end
  end
end