Given("I am on the new patient page") do
    visit new_patient_path
  end
  
  When("I fill in the patient form with valid data") do
    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Doe"
    fill_in "SSN", with: "123456789"
    fill_in "Date of Birth", with: "2000-01-01"
  end
  
  When("I fill in the patient form with invalid data") do
    fill_in "First Name", with: ""
    fill_in "Last Name", with: ""
    fill_in "SSN", with: "123456789"
    fill_in "Date of Birth", with: "2000-01-01"
  end
  
  When("I click the {string} button") do |button|
    click_button button
  end
  
  Then("I should see the patient details page") do
    expect(page).to have_content "Patient Details"
  end
  
  Then("I should see the patient's name, SSN, and date of birth") do
    expect(page).to have_content "John Doe"
    expect(page).to have_content "123456789"
    expect(page).to have_content "2000-01-01"
  end
  
  Then("I should see an error message") do
    expect(page).to have_content "Error"
  end