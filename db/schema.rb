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

ActiveRecord::Schema.define(:version => 20080926131218) do

  create_table "photos", :force => true do |t|
    t.string   "title",         :limit => 50, :null => false
    t.text     "description"
    t.string   "url_full",                    :null => false
    t.string   "url_thumbnail",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["title"], :name => "index_photos_on_title"

end
