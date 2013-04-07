class UsersController < ApplicationController
  def index
  	@users = User.all

  end

  def new


  end

  def create
  	@new_user = User.new(params[:new_user])

  	if @new_user.save
  		flash[:success] = "Success!"
  		redirect_to users_path
  	else 
  		@new_user.errors
  		render 'new'
	end

end
end
