class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.integer  :photo_id, :parent_id, :size, :width, :height, :db_file_id
      t.string   :content_type, :filename, :thumbnail
      t.timestamps
    end
  end
  
  create_table :db_files do |t|
    t.column :data, :binary
  end
  
  def self.down
    drop_table :pictures
    drop_table :db_files
  end
end
