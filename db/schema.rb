# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090511234046) do

  create_table "db_files", :force => true do |t|
    t.binary "data"
  end

  create_table "photos", :force => true do |t|
    t.string   "title",       :limit => 50, :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["title"], :name => "index_photos_on_title"

  create_table "pictures", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "parent_id"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "db_file_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",           :limit => 100, :null => false
    t.string   "salted_password", :limit => 40,  :null => false
    t.string   "salt",            :limit => 40,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
