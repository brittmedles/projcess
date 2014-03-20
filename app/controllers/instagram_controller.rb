class InstagramController < ApplicationController::Base
  
  def connect
    redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end
  
  def callback
    project = Project.find(params[:id])
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    redirect_to("/project/#{project.id}")
  end
  
end
