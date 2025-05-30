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

ActiveRecord::Schema[8.1].define(version: 2025_04_13_165208) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", limit: 2200, null: false
    t.datetime "created_at", null: false
    t.integer "entry_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_comments_on_entry_id"
  end

  create_table "entries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "entryable_id", null: false
    t.string "entryable_type", null: false
    t.integer "likes_count", default: 0, null: false
    t.integer "owner_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entryable_id", "entryable_type"], name: "index_entries_on_entryable_id_and_entryable_type", unique: true
    t.index ["owner_id"], name: "index_entries_on_owner_id"
  end

  create_table "entry_likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "entry_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["entry_id", "user_id"], name: "index_entry_likes_on_entry_id_and_user_id", unique: true
    t.index ["entry_id"], name: "index_entry_likes_on_entry_id"
    t.index ["user_id"], name: "index_entry_likes_on_user_id"
  end

  create_table "follow_requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "followee_id", null: false
    t.integer "requester_id", null: false
    t.datetime "updated_at", null: false
    t.index ["followee_id"], name: "index_follow_requests_on_followee_id"
    t.index ["requester_id", "followee_id"], name: "index_follow_requests_on_requester_id_and_followee_id", unique: true
    t.index ["requester_id"], name: "index_follow_requests_on_requester_id"
  end

  create_table "follows", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "followee_id", null: false
    t.integer "follower_id", null: false
    t.datetime "updated_at", null: false
    t.index ["followee_id"], name: "index_follows_on_followee_id"
    t.index ["follower_id", "followee_id"], name: "index_follows_on_follower_id_and_followee_id", unique: true
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "goal_progress_changes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "goal_id", null: false
    t.decimal "new_value", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "old_value", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "target", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_goal_progress_changes_on_goal_id"
  end

  create_table "goals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "current", precision: 10, scale: 2, default: "0.0", null: false
    t.string "description"
    t.datetime "end_date"
    t.datetime "start_date", null: false
    t.integer "status", default: 0, null: false
    t.decimal "target", precision: 10, scale: 2, default: "0.0", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "visibility", default: 0
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "mentions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "entry_id"
    t.integer "mentionee_id", null: false
    t.integer "mentioner_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_mentions_on_entry_id"
    t.index ["mentionee_id"], name: "index_mentions_on_mentionee_id"
    t.index ["mentioner_id"], name: "index_mentions_on_mentioner_id"
  end

  create_table "notification_comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "entry_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_notification_comments_on_entry_id"
  end

  create_table "notification_follows", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "follow_id", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_notification_follows_on_follow_id"
  end

  create_table "notification_likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "entry_like_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_like_id"], name: "index_notification_likes_on_entry_like_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "notifiable_id", null: false
    t.string "notifiable_type", null: false
    t.datetime "updated_at", null: false
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
  end

  create_table "posts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.integer "goal_progress_change_id"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["goal_progress_change_id"], name: "index_posts_on_goal_progress_change_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "user_notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "notification_id", null: false
    t.datetime "read_at"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["notification_id"], name: "index_user_notifications_on_notification_id"
    t.index ["user_id"], name: "index_user_notifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "password_digest", null: false
    t.integer "profile_visibility", default: 0
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "entries"
  add_foreign_key "entries", "users", column: "owner_id"
  add_foreign_key "entry_likes", "entries"
  add_foreign_key "entry_likes", "users"
  add_foreign_key "follow_requests", "users", column: "followee_id"
  add_foreign_key "follow_requests", "users", column: "requester_id"
  add_foreign_key "follows", "users", column: "followee_id"
  add_foreign_key "follows", "users", column: "follower_id"
  add_foreign_key "goal_progress_changes", "goals"
  add_foreign_key "goals", "users"
  add_foreign_key "mentions", "entries"
  add_foreign_key "mentions", "users", column: "mentionee_id"
  add_foreign_key "mentions", "users", column: "mentioner_id"
  add_foreign_key "notification_comments", "entries"
  add_foreign_key "notification_follows", "follows"
  add_foreign_key "notification_likes", "entry_likes"
  add_foreign_key "posts", "goal_progress_changes"
  add_foreign_key "sessions", "users"
  add_foreign_key "user_notifications", "notifications"
  add_foreign_key "user_notifications", "users"
end
