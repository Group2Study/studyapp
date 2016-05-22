class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def create
    puts " group "
    # puts params['data'].to_h
    # puts params['data'].to_h.class
    @group = Group.new(name: params['data']['name'], private: params['data']['private'], administrable: params['data']['administrable'])
    # @group = Group.new(name: params[:data][:name])
    respond_to do |format|
      format.json do
        if @group.save
          render :json => @group
        else
          render :json => { errors:'true' }
        end
      end
    end
  end

  def list

    @groups = Group.all
    respond_to do |format|
      #format.html
      format.json { render :json => @groups }
    end

  end


  
end
