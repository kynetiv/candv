class UsersController < ApplicationController
  def index
  	@users = User.all

  end

  def show
  	@user = User.find(params[:id])

  end

  def new

  end

  def edit
  	@user = User.find(params[:id])
  end

  def create
  	@new_user = User.new(params[:new_user])

  		if @new_user.save
  			flash[:success] = "Success: New User Created!"
  			redirect_to users_path
  	
  		else render 'new'
		end
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(params[:update])
			flash[:success] = "User Profile Updated!"
			redirect_to @user

		else render 'edit'
		end
	end

	def destroy 
		@user = User.find(params[:id])
		@user.destroy

		flash[:danger] = "Account Deleted!"
		redirect_to users_url
	end
end