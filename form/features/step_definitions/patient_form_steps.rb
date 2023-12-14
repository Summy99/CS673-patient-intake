Given("I am on the new patient page") do
    visit new_patient_path
  end
  
  When("I fill in the patient form with valid data") do
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Doe'
    fill_in 'SSN', with: '123456789'
    fill_in 'Date of Birth', with: '2000-01-01'
    fill_in 'Number', with: '1234567890'
    fill_in 'Street', with: '123MainSt'
    fill_in 'City', with: 'Anytown'
    fill_in 'State', with: 'CA'
    fill_in 'Zip code', with: '12345'
    fill_in 'Email', with: 'johndoe@example.com'
  end
  
  When("I fill in the patient form with invalid data") do
    fill_in "First Name", with: ""
    fill_in "Last Name", with: ""
    fill_in "SSN", with: "123456789"
    fill_in "Date of Birth", with: "2000-01-01"
  end
  
  When("I click the {string} button") do |button|
    click_button(button, disabled: false)
  end
  
  Then("I should see the patient details page") do
    expect(page).to have_content("John Doe", wait: 10)
  end
  
  Then("I should see the patient's name, age") do
    expect(page).to have_content "John Doe"
    expect(page).to have_content "Age:"
  end
  
  Then("I should see an error message") do
    expect(page).to have_content "First name can't be blank and only allows letters"
  end