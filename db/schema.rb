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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_12_150546) do

  create_table "bottles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 191, null: false
    t.integer "vintage", null: false
    t.integer "box_id", null: false
    t.boolean "full", default: true, null: false
    t.string "color", limit: 191
    t.string "family", limit: 191
    t.boolean "sparkling", default: false
    t.text "grapes"
    t.integer "purchase_date"
    t.string "purchase_occasion", limit: 191
    t.string "offerer", limit: 191
    t.text "description"
    t.text "taste_description"
    t.text "recipes_sample"
    t.index ["name"], name: "index_bottles_on_name"
  end

end
