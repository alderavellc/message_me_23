class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :require_user, except: [:index, :show, :new, :create]	
  
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcome to MessageMe."
			redirect_to root_path
		else
			render 'new'
		end
	end


	private
		def set_user
			@user = User.find(params[:id])
		end

  	def user_params
			params.require(:user).permit(:email, :password)
		end

end
