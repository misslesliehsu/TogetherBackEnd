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

ActiveRecord::Schema.define(version: 20180301173838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "date_suggestions", force: :cascade do |t|
    t.bigint "idea_id"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_date_suggestions_on_idea_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "idea_comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "idea_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_idea_comments_on_idea_id"
    t.index ["user_id"], name: "index_idea_comments_on_user_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.bigint "owner_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "scheduled_date"
    t.index ["owner_id"], name: "index_ideas_on_owner_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "invitee_id"
    t.bigint "idea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_invitations_on_idea_id"
    t.index ["invitee_id"], name: "index_invitations_on_invitee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "date_suggestion_id"
    t.bigint "voter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date_suggestion_id"], name: "index_votes_on_date_suggestion_id"
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

  add_foreign_key "date_suggestions", "ideas"
  add_foreign_key "friendships", "users"
  add_foreign_key "idea_comments", "ideas"
  add_foreign_key "idea_comments", "users"
  add_foreign_key "invitations", "ideas"
  add_foreign_key "votes", "date_suggestions"
  add_foreign_key "votes", "users", column: "voter_id"
end
