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

    tags_ids = Tag.all.where("lower(name) like '%#{self.params[:search]}%'").pluck(:id)

    @groups = nil

    unless tags_ids.empty?
      #buscar os grupos que tem as tags
      groups_tags = GroupTag.all.where("tag_id in (#{tags_ids.join(',')})")

      
      groups_id = groups_tags.pluck(:group_id)

      puts "TagsController::search# groups_tags: #{groups_tags.count}"
      
      #puts @params[:search]  

      unless groups_id.empty?
        @groups = Group.all.where("id in (#{groups_id.join(',')})")
      end
    end

    respond_to do |format|
      #format.html
      format.json { render :json => @groups }
    end
  end

  def list_institutes

    if params[:input]
      @institutes = Tag.institutes.where("lower(name) like '%#{params[:input]}%'")
    else
      @institutes = Tag.institutes
    end
    respond_to do |format|
      format.html
      format.json { render :json => @institutes }
    end
  end

  def list_themes
    @themes = Tag.themes
    respond_to do |format|
      format.html
      format.json { render :json => @themes }
    end
  end

end
