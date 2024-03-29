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

ActiveRecord::Schema[7.0].define(version: 2023_03_15_062654) do
  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roles", limit: 1
    t.string "name", limit: 50, null: false
    t.string "nip", limit: 10, null: false
    t.text "address"
    t.string "phone", limit: 13
    t.integer "status", limit: 1, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["nip"], name: "index_admins_on_nip", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "budget_spps", charset: "utf8mb4", force: :cascade do |t|
    t.string "year", null: false
    t.bigint "generation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["generation_id"], name: "index_budget_spps_on_generation_id"
  end

  create_table "class_room_majors", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "class_room_id", null: false
    t.bigint "major_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_room_id"], name: "index_class_room_majors_on_class_room_id"
    t.index ["major_id"], name: "index_class_room_majors_on_major_id"
  end

  create_table "class_rooms", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generations", charset: "utf8mb4", force: :cascade do |t|
    t.string "years", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "majors", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "short", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monthly_spps", charset: "utf8mb4", force: :cascade do |t|
    t.string "month", null: false
    t.decimal "amount", precision: 10, default: "0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "budget_spp_id", null: false
    t.index ["budget_spp_id"], name: "index_monthly_spps_on_budget_spp_id"
  end

  create_table "payment_methods", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "payment_date", null: false
    t.datetime "confirmation_date"
    t.decimal "total", precision: 10, null: false
    t.text "description"
    t.integer "status", default: 0, null: false
    t.bigint "student_id", null: false
    t.bigint "budget_spp_id", null: false
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "monthly_spp_id", null: false
    t.index ["admin_id"], name: "index_payments_on_admin_id"
    t.index ["budget_spp_id"], name: "index_payments_on_budget_spp_id"
    t.index ["monthly_spp_id"], name: "index_payments_on_monthly_spp_id"
    t.index ["student_id"], name: "index_payments_on_student_id"
  end

  create_table "students", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 50, null: false
    t.string "nisn", limit: 10, null: false
    t.string "nis", limit: 9, null: false
    t.text "address"
    t.string "phone", limit: 13
    t.integer "status", limit: 1, null: false
    t.bigint "generation_id", null: false
    t.bigint "class_room_major_id", null: false
    t.index ["class_room_major_id"], name: "index_students_on_class_room_major_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["generation_id"], name: "index_students_on_generation_id"
    t.index ["nis", "nisn"], name: "index_students_on_nis_and_nisn", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "budget_spps", "generations"
  add_foreign_key "class_room_majors", "class_rooms"
  add_foreign_key "class_room_majors", "majors"
  add_foreign_key "monthly_spps", "budget_spps"
  add_foreign_key "payments", "admins"
  add_foreign_key "payments", "budget_spps"
  add_foreign_key "payments", "monthly_spps"
  add_foreign_key "payments", "students"
  add_foreign_key "students", "class_room_majors"
  add_foreign_key "students", "generations"
  create_trigger("budget_spps_after_insert_row_tr", :generated => true, :compatibility => 1).
      on("budget_spps").
      after(:insert) do
    <<-SQL_ACTIONS

        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('Janurary', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('February', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('March', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('April', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('May', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('June', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('July', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('August', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('September', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('October', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('November', NEW.id, CURRENT_TIME(), CURRENT_TIME());
        INSERT INTO monthly_spps (month, budget_spp_id, created_at, updated_at) VALUES ('December', NEW.id, CURRENT_TIME(), CURRENT_TIME());
    SQL_ACTIONS
  end

  create_trigger("generations_after_insert_row_tr", :generated => true, :compatibility => 1).
      on("generations").
      after(:insert) do
    <<-SQL_ACTIONS

        SET @year1 = CAST(SUBSTRING_INDEX(NEW.years, '/', 1) AS UNSIGNED);
        SET @year2 = CAST(SUBSTRING_INDEX(NEW.years, '/', -1) AS UNSIGNED);

        WHILE @year1 <= @year2 DO
          INSERT INTO budget_spps (year, generation_id, created_at, updated_at) VALUES (CAST(@year1 AS NCHAR), NEW.id, CURRENT_TIME(), CURRENT_TIME());
          SET @year1 = @year1 + 1;
        END WHILE;
    SQL_ACTIONS
  end

end
