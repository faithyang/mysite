class AdminController < ApplicationController
  def authenticate
    if(params[:name] == "dave" && params[:password] == "123123")
      session[:isauthen] = true
      redirect_to articles_path
    else
      redirect_to login_path, notice: "Invalid Name/Password combination"
      session[:isauthen] = nil
    end    
  end
  
  def logout
    if(session[:isauthen])
      session[:isauthen] = nil
      redirect_to root_url
    end
  end
end
