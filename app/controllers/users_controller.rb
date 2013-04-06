class UsersController < ApplicationController
  def index
  	@users = User.all

  end

  def new


  end

  def create
  	@new_user = User.new(params[:new_user])

  	if @new_user.save
  		flash[:notice] = "Sucess!"
  		redirect_to :controller => 'users', :action => 'index'
  	else 
  		render :action => 'new'
	end

end
end
