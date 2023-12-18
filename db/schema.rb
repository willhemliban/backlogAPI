# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_18_124821) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "igdb_id"
    t.date "release_date"
    t.decimal "rating"
    t.string "platform"
    t.string "genre"
    t.string "publisher"
    t.string "developer"
    t.string "cover_url"
    t.text "summary"
    t.text "storyline"
    t.json "screenshots"
    t.json "videos"
    t.json "websites"
    t.boolean "multiplayer"
    t.json "player_perspectives"
    t.json "themes"
    t.json "modes"
    t.json "franchises"
    t.json "similar_games"
    t.decimal "total_rating"
    t.integer "total_rating_count"
    t.decimal "popularity"
    t.decimal "aggregated_rating"
    t.integer "aggregated_rating_count"
    t.json "platforms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
