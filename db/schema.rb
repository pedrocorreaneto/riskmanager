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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151203000201) do

  create_table "mitigations", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "consequences"
    t.integer  "usedtimes"
    t.integer  "threat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mitigations", ["threat_id"], name: "index_mitigations_on_threat_id"

  create_table "mitigations_risks", id: false, force: :cascade do |t|
    t.integer "risk_id"
    t.integer "mitigation_id"
  end

  add_index "mitigations_risks", ["mitigation_id"], name: "index_mitigations_risks_on_mitigation_id"
  add_index "mitigations_risks", ["risk_id"], name: "index_mitigations_risks_on_risk_id"

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "risks", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "threat_id"
    t.boolean  "riskaccept"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "probability"
    t.decimal  "impact"
    t.decimal  "exposure"
  end

  add_index "risks", ["project_id"], name: "index_risks_on_project_id"
  add_index "risks", ["threat_id"], name: "index_risks_on_threat_id"

  create_table "threats", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "context"
  end

end
