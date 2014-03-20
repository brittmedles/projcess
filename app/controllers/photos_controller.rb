class PhotosController < ApplicationController::Base
  
  def index
    @students = Student.all
  end
 
  def show
    @student = Student.find(params[:id])
  end
 
  def new
    @student = Student.new()
  end
  
  def create
    @student = Student.new(params[:student])
   
    if @student.save # If this fails to save, it returns FALSE.
     
      # For successful saves:
      redirect_to(:students)
     
    else
      # Show the errors to the user.
      render "new"
    end
  end
 
  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
   
    @student.update_attributes({:name => params[:name]})
   
    redirect_to(student_path(@student.id))
  end
 
  def destroy
    @student = Student.find(params[:id])
   
    @student.delete
   
    redirect_to(:students)
  end
  
end
