class GroupsController < ApplicationController
  def index
    @group_id = params[:id]

  end

  def show
    @group_id = params[:id]
    puts "show# ID: #{@group_id}"
    respond_to do |format|
      #format.html
      format.json do
        if @group_id
          @group = Group.find(@group_id)
        end
        render :json => @group 
      end
    end
  end

  def create
    puts " GROUP CREATE "
    puts params['data'].to_h
    puts params['data'].to_h.class
    @group = Group.new(name: params['data']['name'], private: params['data']['private'], administrable: params['data']['administrable'])
    # @group = Group.new(name: params[:data][:name])
    respond_to do |format|
      format.json do
        if @group.save
          render :json => @group
        else
          render :json => { errors: 'true' }
        end
      end
    end
  end

  def update
    puts " GROUP UPDATE "
    puts params[:data][:id].empty?
    puts params[:data].class
    if !params[:data][:id].empty?
      @group = Group.find params[:data][:id]
      if @group.update_attributes(name: params['data']['name'], private: params['data']['private'], administrable: params['data']['administrable'])
        respond_to do |format|
          format.json do
            unless @group.nil?
              render :json => nil
            else
              render :json => { errors: 'true' }
            end
          end
        end
      else
        render :json => { errors: 'true' }
      end
    else
      create
    end
  end

  def list
    @groups = Group.all
    respond_to do |format|
      #format.html
      format.json { render :json => @groups }
    end
  end

  def related_tags
    @tags = Group.tags
    respond_to do |format|
      #format.html
      format.json { render :json => @tags }
    end
  end

  def institutes
    group_id = params[:id]
    tag_type_id = TagType.find_by("key = 'institute'").id

    tags_id = Tag.all().where("tag_type_id = #{tag_type_id}").pluck(:id)

    puts "institutes# T: #@tags_id}"

    unless tags_id.empty?
      group_tags_id = GroupTag.all().where("tag_id in (#{tags_id.join(',')}) and group_id = #{group_id}").pluck(:tag_id)

      puts "institutes# G: #{group_tags_id}"

      unless group_tags_id.empty?
        @institutes = Tag.all().where("id in (#{group_tags_id.join(',')})")

        puts "institutes# I: #{@institutes}"
      end
    end

    #group = Group.find(group_id);
    #@institutes = group.tags.join("tag_types").where("key = 'institute'")
    respond_to do |format|
      #format.html
      format.json { render :json => @institutes }
    end

  end

  def themes
    group_id = params[:id]
    group = Group.find(group_id);
    @themes = group.tags.where("key = 'theme'")
    respond_to do |format|
      #format.html
      format.json { render :json => @themes }
    end
  end

  def associate_institute
    group_id = params[:id]
    tag_id = params[:tag_id]

    puts "associate_institute# group_id: #{group_id} tag_id: #{tag_id}"

    group_tag = GroupTag.new(group_id: group_id, tag_id: tag_id)
    group_tag.save
    respond_to do |format|
      #format.html
      format.json { render :json => group_tag }
    end

  end

end
