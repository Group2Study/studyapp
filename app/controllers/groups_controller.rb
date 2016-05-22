class GroupsController < ApplicationController
  def index
  end

  def new
  end

  def list

    @groups = Group.all
    respond_to do |format|
      #format.html
      format.json { render :json => @groups }
    end

  end
end
