class PhotoService
  attr_reader :photo, :picture

  def initialize(photo,picture)
    @photo = photo
    @picture = picture
  end

  def save
    return false unless valid?
    begin
      Photo.transaction do
        if @photo.new_record? 
          @photo.picture.destroy if @photo.picture
          @picture.photo = @photo
          @picture.save!
        end
        @photo.save!
      end
    end
  end

  def valid?
    @photo.valid? && @picture.valid?
  end

  def update_attributes(photo_attributes, picture_file)
    @photo.attributes = photo_attributes
    unless picture_file.blank?
      @picture = Picture.new(:uploaded_data => picture_file)
    end
    save
  end

end
