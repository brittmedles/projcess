class PhotosController < ApplicationController::Base
  
  def index
    @photos = Photo.all
  end
 
  def show
    @photo = Photo.find(params[:id])
  end
 
  def new
    @photo = Photo.new()
  end
  
  def create
    @photo = Photo.new(params[:photo])
   
    if @photo.save # If this fails to save, it returns FALSE.
     
      # For successful saves:
      redirect_to(:photos)
     
    else
      # Show the errors to the user.
      render "new"
    end
  end
 
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @photo = Photo.find(params[:id])
   
    @photo.update_attributes({:name => params[:name]})
   
    redirect_to(photo_path(@photo.id))
  end
 
  def destroy
    @photo = Photo.find(params[:id])
   
    @photo.delete
   
    redirect_to(:photos)
  end
  
end
