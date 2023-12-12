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

ActiveRecord::Schema[7.0].define(version: 2023_12_12_162031) do
  create_table "aux_contact_numbers", force: :cascade do |t|
    t.string "contact_number"
    t.string "contact_person_ssn", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aux_email_ids", force: :cascade do |t|
    t.string "email_id"
    t.string "contact_person_ssn", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_numbers", force: :cascade do |t|
    t.string "number"
    t.string "patient_ssn", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_addresses", force: :cascade do |t|
    t.string "email"
    t.string "patient_ssn", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emergency_contact_people", primary_key: "contact_person_ssn", id: :string, force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.date "dob"
    t.integer "age"
    t.string "relationship"
    t.string "address"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "patient_id"
    t.index ["patient_id"], name: "index_emergency_contact_people_on_patient_id"
  end

  create_table "medical_histories", primary_key: "conditionID", id: :string, force: :cascade do |t|
    t.string "condition_type"
    t.string "condition_name"
    t.string "diagnosis"
    t.string "status"
    t.date "diagnosis_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "patient_ssn"
  end

  create_table "medications", primary_key: "medicineID", id: :string, force: :cascade do |t|
    t.string "medicine_name"
    t.string "dosage"
    t.string "frequency"
    t.string "admin_method"
    t.string "patient_ssn"
  end

  create_table "patients", primary_key: "ssn", id: :string, force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "gender"
    t.string "ethnicity"
    t.string "race"
    t.date "dob"
    t.integer "age"
    t.string "address"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "disability_type"
    t.string "goals"
    t.index ["ssn"], name: "index_patients_on_ssn", unique: true
  end

  create_table "treatments", primary_key: "treatmentID", id: :string, force: :cascade do |t|
    t.string "treatment_type"
    t.string "treatment_notes"
    t.date "start_date"
    t.date "end_date"
    t.string "patient_ssn"
  end

  add_foreign_key "aux_contact_numbers", "emergency_contact_people", column: "contact_person_ssn", primary_key: "contact_person_ssn", on_delete: :cascade
  add_foreign_key "aux_email_ids", "emergency_contact_people", column: "contact_person_ssn", primary_key: "contact_person_ssn", on_delete: :cascade
  add_foreign_key "contact_numbers", "patients", column: "patient_ssn", primary_key: "ssn", on_delete: :cascade
  add_foreign_key "email_addresses", "patients", column: "patient_ssn", primary_key: "ssn", on_delete: :cascade
  add_foreign_key "emergency_contact_people", "patients", primary_key: "ssn"
  add_foreign_key "medical_histories", "patients", column: "patient_ssn", primary_key: "ssn", on_delete: :cascade
  add_foreign_key "medications", "patients", column: "patient_ssn", primary_key: "ssn", on_delete: :cascade
  add_foreign_key "treatments", "patients", column: "patient_ssn", primary_key: "ssn", on_delete: :cascade
end
