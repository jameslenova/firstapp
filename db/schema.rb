# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130101183657) do

  create_table "chooselocations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "chooselocations", ["location_id"], :name => "index_chooselocations_on_location_id"
  add_index "chooselocations", ["user_id", "location_id"], :name => "index_chooselocations_on_user_id_and_location_id", :unique => true
  add_index "chooselocations", ["user_id"], :name => "index_chooselocations_on_user_id"

  create_table "choosestudygroups", :force => true do |t|
    t.integer  "studygroup_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "choosestudygroups", ["studygroup_id"], :name => "index_choosestudygroups_on_studygroup_id"
  add_index "choosestudygroups", ["user_id", "studygroup_id"], :name => "index_choosestudygroups_on_user_id_and_studygroup_id", :unique => true
  add_index "choosestudygroups", ["user_id"], :name => "index_choosestudygroups_on_user_id"

  create_table "choosesubjects", :force => true do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "choosesubjects", ["subject_id"], :name => "index_choosesubjects_on_subject_id"
  add_index "choosesubjects", ["user_id", "subject_id"], :name => "index_choosesubjects_on_user_id_and_subject_id", :unique => true
  add_index "choosesubjects", ["user_id"], :name => "index_choosesubjects_on_user_id"

  create_table "forums", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "content",    :default => ""
    t.integer  "ratingplus"
    t.integer  "ratingdown"
    t.integer  "user_id"
    t.integer  "message_id"
    t.integer  "topic_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "messages", ["topic_id", "created_at"], :name => "index_messages_on_topic_id_and_created_at"

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.integer  "forum_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sections", ["forum_id"], :name => "index_sections_on_forum_id"

  create_table "studygroups", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "location_id"
    t.datetime "classtime"
    t.string   "day"
    t.boolean  "activated",   :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "min",         :default => 5
    t.integer  "max",         :default => 10
    t.integer  "forum_id"
  end

  add_index "studygroups", ["location_id", "created_at"], :name => "index_studygroups_on_location_id_and_created_at"
  add_index "studygroups", ["subject_id", "created_at"], :name => "index_studygroups_on_subject_id_and_created_at"

  create_table "subjects", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "title",      :default => ""
    t.integer  "section_id"
    t.string   "content",    :default => ""
    t.integer  "user_id"
    t.integer  "ratingup",   :default => 0
    t.integer  "ratingdown", :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "topics", ["section_id", "created_at"], :name => "index_topics_on_section_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
