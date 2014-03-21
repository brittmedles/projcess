class ProjectsController < ApplicationController::Base
  
  def index
    @projects = Project.all
  end
 
  def show
    @project = Project.find(params[:id])
  end
 
  def new
    @project = Project.new()
  end
  
  def create
    @project = Project.new(params[:project])
   
    if @project.save # If this fails to save, it returns FALSE.
     
      # For successful saves:
      redirect_to(:projects)
     
    else
      # Show the errors to the user.
      render "new"
    end
  end
 
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
   
    @project.update_attributes({:name => params[:name]})
   
    redirect_to(project_path(@project.id))
  end
 
  def destroy
    @project = Project.find(params[:id])
   
    @project.delete
   
    redirect_to(:students)
  end
  
end
