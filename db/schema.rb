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

ActiveRecord::Schema.define(version: 20140815004740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  create_table "job_applications", force: true do |t|
    t.integer  "jobseeker_id"
    t.integer  "job_post_id"
    t.datetime "applied_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_posts", force: true do |t|
    t.integer  "company_id"
    t.string   "position"
    t.text     "requirements"
    t.text     "description"
    t.boolean  "apply_internal", default: true
    t.string   "web_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "jobseekers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "match_qualities", force: true do |t|
    t.integer  "job_post_id"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stack_items", force: true do |t|
    t.integer  "stack_id"
    t.integer  "technology_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stacks", force: true do |t|
    t.integer  "stackable_id"
    t.string   "stackable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technologies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

end
