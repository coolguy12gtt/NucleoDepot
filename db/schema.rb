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

ActiveRecord::Schema[7.0].define(version: 2022_03_25_055030) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drugs", force: :cascade do |t|
    t.string "gene"
    t.string "source"
    t.string "drug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genes", force: :cascade do |t|
    t.string "identity"
    t.string "name"
    t.text "information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "form"
    t.string "mutation"
    t.string "mutationLocation"
    t.string "detailedMutations"
    t.string "resultant"
    t.string "cFrequency"
    t.string "gdcFrequency"
  end

  create_table "images", force: :cascade do |t|
    t.string "form"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
  end

  create_table "meutations", force: :cascade do |t|
    t.string "form"
    t.string "identity"
    t.string "location"
    t.string "subtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
  end

  create_table "webs", force: :cascade do |t|
    t.string "link"
    t.text "information"
    t.string "form"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
