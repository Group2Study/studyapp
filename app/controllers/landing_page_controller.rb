class LandingPageController < ApplicationController
  def index
    @tags = Tag.all
    respond_to do |format|
      format.html
      format.json { render :json => @tags }
    end
  end
end
