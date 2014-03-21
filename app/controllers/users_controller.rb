class UsersController < ApplicationController::Base
  
  def index
    @users = User.all
  end
 
  def show
    @user = User.find_by_name(params[:name])
    @projects = @user.projects
    # @user = User.find(params[:id])
  end
 
  def new
    @user = User.new()
  end
  
  def create
    @user = User.new(params[:user])
   
    if @user.save # If this fails to save, it returns FALSE.
     
      # For successful saves:
      redirect_to(:users)
     
    else
      # Show the errors to the user.
      render "new"
    end
  end
 
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
   
    @user.update_attributes({:name => params[:name]})
   
    redirect_to(user_path(@user.id))
  end
 
  def destroy
    @user = User.find(params[:id])
   
    @user.delete
   
    redirect_to(:users)
  end
  
end
