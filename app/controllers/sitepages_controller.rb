class SitepagesController < ApplicationController
  before_filter :is_authen, except: [:home, :login]
  
  def home
    @pagetitle = "Dave Wu"
    
    @my_articles = Article.where(show_on_homepage: true)
    
    tip = request.ip
    tua = request.headers["HTTP_USER_AGENT"]
    
    visit_obj = Sitevisit.new
    visit_obj.ip = tip
    visit_obj.ua = tua
    visit_obj.save
    
  end
  
  def login
    @pagetitle = "Login Just for Myself"
  end
  
  def visits_statistics
    @pagetitle = "Statistics"
    
    @visits = Sitevisit.all
    
  end
  
  def upload
    
    @uploaded_files = Dir.glob(Rails.root.join('public','images','*.*'))
    
    
    
  end
  
  def upload_file
    
    uploaded_io = params[:picture]
    File.open(Rails.root.join('public', 'images', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    
    respond_to do |format|
      format.html { redirect_to upload_url }
      format.json { head :no_content }
    end
    
    
  end
  
  protected
  
  def is_authen
    unless(session[:isauthen] == true)
      redirect_to login_url, notice: "You should login first"
    end
  end 
end
