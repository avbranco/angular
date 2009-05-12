module PhotosHelper

  def picture_for(photo, size = :small)
    if photo.picture
      picture_image = photo.picture.public_filename(size)
      link_to image_tag(picture_image), photo.picture.public_filename
    else
      image_tag("blank-cover-#{size}.png" )
    end
  end

end
