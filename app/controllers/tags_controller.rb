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
    puts "TagsController::search# P: #{self.params[:search]}"

    @tags = Tag.find_by("lower(name) like '%#{self.params[:search]}%'")
    #puts @params[:search]

    respond_to do |format|
      #format.html
      format.json { render :json => @tags }
    end
  end

  def list_institutes
    @institutes = Tag.institutes
    respond_to do |format|
      format.html
      format.json { render :json => @institutes }
    end
  end

  def list_institutes
    @themes = Tag.themes
    respond_to do |format|
      format.html
      format.json { render :json => @themes }
    end
  end

end
