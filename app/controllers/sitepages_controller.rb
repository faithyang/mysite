class SitepagesController < ApplicationController
  def home
    @pagetitle = "Dave Wu"
    
    @my_articles = Article.where(show_on_homepage: true)
  end
end
