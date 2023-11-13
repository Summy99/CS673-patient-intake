# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
PatientAPI.create(first_name: "John", last_name: "Doe", gender: "Male", dob: "01/01/2000", ssn: "111111111", phone_number: "123-456-7890", email: "johnsmith@gmail.com", address: "123 Main St", city: "New York", state: "NY", zip_code: "10001")