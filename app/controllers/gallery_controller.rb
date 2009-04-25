class GalleryController < ApplicationController
  def index
    @photos = Photo.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end
end
