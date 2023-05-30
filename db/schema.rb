ActiveRecord::Schema[7.0].define(version: 2023_05_10_185034) do
  create_table "contacts", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "dob"
    t.string "category"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contact_id"
    t.integer "note_id"
    t.index ["contact_id"], name: "index_documents_on_contact_id"
    t.index ["note_id"], name: "index_documents_on_note_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title", null: false
    t.string "details", null: false
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contact_id"
    t.index ["contact_id"], name: "index_notes_on_contact_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.string "details", null: false
    t.boolean "status", default: false, null: false
    t.string "priority", default: "1", null: false
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contact_id"
    t.integer "note_id"
    t.index ["contact_id"], name: "index_tasks_on_contact_id"
    t.index ["note_id"], name: "index_tasks_on_note_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "organization"
    t.string "title"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "documents", "contacts"
  add_foreign_key "documents", "notes"
  add_foreign_key "notes", "contacts"
  add_foreign_key "tasks", "contacts"
  add_foreign_key "tasks", "notes"
end
