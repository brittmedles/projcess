# Instagram code:
enable :sessions
CALLBACK_URL = "http://localhost:9292/oauth/callback"

class IntegrationsController < ApplicationController::Base
  
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
