class PagesController < ActionController::Base
  
  def home
    @projects = Project.all
  end
  
  def new_user
    user_name = params[:user_name]
    user = User.create({:user_name => user_name}) 
  end
  
  def login
    user_name = params[:user_name]
  
    user = User.find_by_user_name(params[:user_name])
    redirect to("/user/#{user.id}")
  end
  
  def profile
    @user = User.find(params[:id])
    @project = Project.find_by_project_name(@user.project_name)
  end
  
  def update
    user_name = params[:user_name]
    user = User.find(params[:id])
  
    user.update_attributes({:user_name => user_name})
    
    redirect to("/user/#{user.id}")
  end
  
  def add_project
    @user = User.find(params[:id])
  end
  
  def save_project
    user = User.find(params[:id])
    project = Project.create(:project_name => params[:project_name], :user => params[:id])
    
    project_name = params[:project_name]
    user.update_attributes({:project_name => project_name})
    
    redirect to("/add_photo/#{project.id}")
  end
  
  def join_project
    @user = User.find(params[:id])
    erb :join_project
  end
  
  
  
  
  
  
  
  
end
