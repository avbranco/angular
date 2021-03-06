class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.column :title, :string, :limit => 50, :null => false
      t.column :description, :text
      
      t.timestamps
    end
    add_index :photos, [:title], :title => :photos_title_index, :unique => false
  end

  def self.down
    #remove_index :photos, :title=> :users_title_index
    drop_table :photos
  end
end
