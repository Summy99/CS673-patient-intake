# db/seeds.rb

# Seed Doctors
adam = Doctor.create!(id: 1, name: 'Adam')
sarah = Doctor.create!(id: 2, name: 'Sarah')
grace = Doctor.create!(id: 3, name: 'Grace')
john = Doctor.create!(id: 4, name: 'John')

puts 'Doctors seeded successfully!'

# Function to generate random patient attributes
def generate_random_patient(doctor_id)
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  ssn = Faker::IDNumber.unique.ssn
  phone_number = Faker::PhoneNumber.phone_number
  address = Faker::Address.street_address
  city = Faker::Address.city
  state = Faker::Address.state
  zip_code = Faker::Address.zip_code
  disability_type = ['Hospice', 'Assisted Living', 'Memory Care', 'Skilled Nursing', 'Retirement Community'].sample
  race = ['Race 1', 'Race 2', 'Race 3'].sample
  ethnicity = Faker::Demographic.ethnicity

  {
    first_name: first_name,
    last_name: last_name,
    ssn: ssn,
    phone_number: phone_number,
    address: address,
    city: city,
    state: state,
    zip_code: zip_code,
    disability_type: disability_type,
    race: race,
    ethnicity: ethnicity,
    doctor_id: doctor_id
  }
end

# Create 40 patients and assign them to doctors
40.times do
  random_doctor = [adam, sarah, grace, john].sample
  patient_attributes = generate_random_patient(random_doctor.id)
  Patient.create!(patient_attributes)
end

puts 'Patients seeded successfully!'
