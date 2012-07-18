# -*- encoding : utf-8 -*-
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

ActiveRecord::Schema.define(:version => 20100420214822) do

  create_table "appearances", :force => true do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.integer  "team_id"
    t.float    "rating"
    t.integer  "start"
    t.integer  "end"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.decimal  "rating_average", :precision => 6, :scale => 2, :default => 3.0
  end

  create_table "article_galleries", :force => true do |t|
    t.integer  "article_id"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_tags", :force => true do |t|
    t.integer  "article_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.boolean  "published",        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "abstract"
    t.string   "summary_sentence"
    t.integer  "view_counter"
  end

  create_table "avatars", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "view_file_name"
    t.string   "view_content_type"
    t.integer  "view_file_size"
    t.datetime "view_updated_at"
  end

  create_table "broadcast_messages", :force => true do |t|
    t.integer  "live_broadcast_id"
    t.text     "body"
    t.string   "minute"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", :force => true do |t|
    t.integer  "player_id"
    t.integer  "appearance_id"
    t.integer  "team_id"
    t.integer  "minute"
    t.text     "info"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "club_informations", :force => true do |t|
    t.text     "history",    :default => " "
    t.text     "officials",  :default => " "
    t.text     "trophies",   :default => " "
    t.text     "contact",    :default => " "
    t.text     "sponsors",   :default => " "
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clubs", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", :force => true do |t|
    t.integer  "player_id"
    t.integer  "season_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  create_table "gallery_contents", :force => true do |t|
    t.integer  "gallery_id"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", :force => true do |t|
    t.integer  "player_id"
    t.integer  "appearance_id"
    t.integer  "team_id"
    t.integer  "minute"
    t.text     "info"
    t.boolean  "own"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "live_broadcasts", :force => true do |t|
    t.integer  "match_id"
    t.datetime "first_half_start"
    t.datetime "second_half_start"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main_photos", :force => true do |t|
    t.integer  "gallery_id"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", :force => true do |t|
    t.integer  "season_id"
    t.integer  "team_id"
    t.integer  "rival_id"
    t.datetime "match_start"
    t.integer  "home"
    t.integer  "away"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "role_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.datetime "added"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "view_file_name"
    t.string   "view_content_type"
    t.integer  "view_file_size"
    t.datetime "view_updated_at"
  end

  create_table "player_galleries", :force => true do |t|
    t.integer  "player_id"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "weight"
    t.integer  "height"
    t.date     "birthdate"
    t.text     "information"
    t.string   "position"
    t.string   "side"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars",         :null => false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

  create_table "roles", :force => true do |t|
    t.string   "rolename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "season_standings", :force => true do |t|
    t.integer  "season_id"
    t.integer  "team_id"
    t.integer  "position"
    t.integer  "matches"
    t.integer  "points"
    t.integer  "wins"
    t.integer  "draws"
    t.integer  "losses"
    t.integer  "goals"
    t.integer  "lost_goals"
    t.integer  "away_matches"
    t.integer  "away_points"
    t.integer  "away_wins"
    t.integer  "away_draws"
    t.integer  "away_losses"
    t.integer  "away_goals"
    t.integer  "away_lost_goals"
    t.integer  "home_matches"
    t.integer  "home_points"
    t.integer  "home_wins"
    t.integer  "home_draws"
    t.integer  "home_losses"
    t.integer  "home_goals"
    t.integer  "home_lost_goals"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", :force => true do |t|
    t.string   "name"
    t.date     "start_at"
    t.date     "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  create_table "shoutboxes", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "staff_teams", :force => true do |t|
    t.integer  "staff_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staffs", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthdate"
    t.text     "information"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "counter"
  end

  create_table "teams", :force => true do |t|
    t.integer  "club_id"
    t.string   "name"
    t.string   "official_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.integer  "warnings",                                :default => 0
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "password_reset_code",       :limit => 40
    t.boolean  "enabled",                                 :default => true
  end

  create_table "view_modules", :force => true do |t|
    t.string   "name"
    t.string   "partial"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
