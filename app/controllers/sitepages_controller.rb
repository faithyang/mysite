class SitepagesController < ApplicationController
  def home
    @pagetitle = "Dave Wu"
    
    @my_articles = Article.all
  end
end
