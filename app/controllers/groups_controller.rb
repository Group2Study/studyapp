class GroupsController < ApplicationController
  def index
    @group_id = params[:id]

    

  end

  def show
    @group_id = params[:id]
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
end
