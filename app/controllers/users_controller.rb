class UsersController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			Noification.newuser(@user).deliver
			redirect_to users_path, notice: "User was created Successfully"
			
			
		else
			render action: "new"
		end
	end

	 def edit
	  	@user = User.find(params[:id])
	  end

	  

	  def destroy
	  	@user = User.find(params[:id])
	  	@user.destroy
	  	redirect_to users_path, notice: "Successfully destroyed"
	  end


	private
	def user_params
		params[:user].permit(:email, :password, role_ids:[])
	end
end
