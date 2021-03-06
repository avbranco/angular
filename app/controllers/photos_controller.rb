class PhotosController < ApplicationController
  
  before_filter :check_logged_in
  
  layout 'gallery'

  # GET /photos
  # GET /photos.xml
  def index
    @photos = Photo.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end
  
  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.find(params[:id])
    if thumbnail = params[:thumbnail]
      picture = @photo.picture.thumbnails.first
    else
      picture = @photo.picture
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo.to_xml }
      format.jpg do
        data = picture.db_file.data
        send_data(data, :type => 'image/jpeg',
                  :filename => picture.filename,
                  :disposition => 'inline'
                  )
      end
    end
  end
  
  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end
  
  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end
  
  # POST /photos
  # POST /photos.xml
  def create
    @photo = Photo.new(params[:photo])
    @picture = Picture.new (:uploaded_data => params[:picture_file])

    @service = PhotoService.new(@photo,@picture)

    respond_to do |format|
      if @service.save
        flash[:notice] = 'Photo was successfully created.'
        format.html { redirect_to(@photo) }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = Photo.find(params[:id])
    @picture = @photo.picture
    
    @service = PhotoService.new(@photo,@picture)

    respond_to do |format|
      if @service.update_attributes(params[:photo],params[:picture_file])
        flash[:notice] = 'Photo was successfully updated.'
        format.html { redirect_to(@photo) }
        format.xml  { head :ok }
      else
        @picture = @service.picture
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
      
    respond_to do |format|
      format.html { redirect_to(photos_url) }
      format.xml  { head :ok }
    end
  end

  private
  def check_logged_in
    if (params[:action] != 'show')
      authenticate_or_request_with_http_basic("Photos") do |username, password|
        username == "admin" && password == "123poi098"
      end
    end
  end


end
