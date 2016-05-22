class TagsController < ApplicationController
  def index
    @tags = Tag.all
    respond_to do |format|
      format.html
      format.json { render :json => @tags }
    end
  end

  def create
    
  end

  def search
    puts "TagsController::search"
    puts @params
  end

end
