class PagesController < ActionController::Base
  
  def home
    @projects = Project.all
  end
  
  def new_user
    user_name = params[:user_name]
    user = User.create({:user_name => user_name})
    redirect_to("/home") 
  end
  
  def login
    user_name = params[:user_name]
  
    user = User.find_by_user_name(params[:user_name])
    redirect_to("/user/#{user.id}")
  end
  
  def profile
    @user = User.find(params[:id])
    @project = Project.find_by_project_name(@user.project_name)
  end
  
  def update
    user_name = params[:user_name]
    user = User.find(params[:id])
  
    user.update_attributes({:user_name => user_name})
    
    redirect_to("/user/#{user.id}")
  end
  
  def add_project
    @user = User.find(params[:id])
  end
  
  def save_project
    user = User.find(params[:id])
    project = Project.create(:project_name => params[:project_name], :user => params[:id])
    
    project_name = params[:project_name]
    user.update_attributes({:project_name => project_name})
    
    redirect_to("/add_photo/#{project.id}")
  end
  
  def join_project
    @user = User.find(params[:id])
  end
  
  def find_project
    user = User.find(params[:id])
    
    project_name = params[:project_name]
    user.update_attributes({:project_name => project_name})
    project = Project.find_by_project_name(project_name)
    
    redirect_to("/add_photo/#{project.id}")
  end
  
  def add_photo
    @project = Project.find(params[:id]) 
  end
  
  def project
    @project = Project.find(params[:id])
  
    @filename = params[:file][:filename]
      file = params[:file][:tempfile]
 
      File.open("app/public/#{@filename}", 'wb') do |f|
        f.write(file.read)
      end
    
    @photo = Photo.new(:proj_id => params[:id], :filename => @filename)
    @photo.save
    
    @photos = Photo.where("proj_id = ?", @project.id).order("timestamp DESC").limit(9)
        if @photos.any?
          redirect_to("/project")
        else
          redirect_to("/add_photo/#{project.id}") 
        end
  end
  
end
