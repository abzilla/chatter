ActiveRecord::Schema.define(version: 20131024172457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "friendship_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", null: false
    t.string   "name",            null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
