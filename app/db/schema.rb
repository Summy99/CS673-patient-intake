# db/schema.rb

ActiveRecord::Schema.define(version: 2023_12_01_000000) do
    create_table "doctors", force: :cascade do |t|
      t.string "name"
      t.timestamps
    end
  
    create_table "patients", force: :cascade do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "ssn"
      t.string "phone_number"
      t.string "address"
      t.string "city"
      t.string "state"
      t.string "zip_code"
      t.string "disability_type"
      t.string "race"
      t.string "ethnicity"
      t.timestamps
    end
  
    create_table "doctors_patients", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.references :doctor, null: false, foreign_key: true, type: :uuid
      t.references :patient, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end  