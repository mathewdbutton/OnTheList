# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_13_071427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "fuzzystrmatch"
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_items_on_name"
  end

  create_table "list_items", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "item_id"
    t.string "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_list_items_on_item_id"
    t.index ["list_id"], name: "index_list_items_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "method_recipe_items", force: :cascade do |t|
    t.string "quantity"
    t.bigint "recipe_method_id", null: false
    t.bigint "recipe_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_item_id"], name: "index_method_recipe_items_on_recipe_item_id"
    t.index ["recipe_method_id"], name: "index_method_recipe_items_on_recipe_method_id"
  end

  create_table "recipe_items", force: :cascade do |t|
    t.string "quantity"
    t.bigint "recipe_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_recipe_items_on_item_id"
    t.index ["recipe_id"], name: "index_recipe_items_on_recipe_id"
  end

  create_table "recipe_methods", force: :cascade do |t|
    t.string "step"
    t.integer "order"
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_recipe_methods_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "method_recipe_items", "recipe_items"
  add_foreign_key "method_recipe_items", "recipe_methods"
  add_foreign_key "recipe_items", "items"
  add_foreign_key "recipe_items", "recipes"
  add_foreign_key "recipe_methods", "recipes"
end
