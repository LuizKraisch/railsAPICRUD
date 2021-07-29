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

ActiveRecord::Schema.define(version: 2021_07_16_234223) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_categories_on_organization_id"
  end

  create_table "category_relations", force: :cascade do |t|
    t.string "category_type", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_type", "category_id"], name: "index_category_relations_on_category"
  end

  create_table "employees", force: :cascade do |t|
    t.integer "person_id", null: false
    t.string "area"
    t.text "description"
    t.float "payment_claim"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_employees_on_person_id"
  end

  create_table "graduations", force: :cascade do |t|
    t.integer "person_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_graduations_on_person_id"
  end

  create_table "opportunities", force: :cascade do |t|
    t.integer "organization_id"
    t.string "title"
    t.text "description"
    t.date "initial_date"
    t.float "salary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_opportunities_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.integer "cnpj"
    t.string "org_type"
    t.integer "num_employees"
    t.string "area"
    t.string "city"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.integer "organization_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "telephone"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_people_on_organization_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "organization_id", null: false
    t.string "area"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_recruiters_on_organization_id"
    t.index ["person_id"], name: "index_recruiters_on_person_id"
  end

  add_foreign_key "employees", "people"
  add_foreign_key "graduations", "people"
  add_foreign_key "opportunities", "organizations"
  add_foreign_key "people", "organizations"
  add_foreign_key "recruiters", "organizations"
  add_foreign_key "recruiters", "people"
end
