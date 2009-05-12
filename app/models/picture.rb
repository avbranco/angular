class Picture < ActiveRecord::Base

  belongs_to :photo

  has_attachment :content_type => :image,
                 :storage      => :file_system,
                 :max_size     => 500.kilobytes,
                 :resize_to    => '800x533>',
                 :thumbnails   => {
                   :small => '100x67>' 
                 }
  
  validates_as_attachment

end
