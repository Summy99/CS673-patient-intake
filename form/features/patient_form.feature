Feature: Patient Form

  Scenario: Submitting the patient form with valid data
    Given I am on the new patient page
    When I fill in the patient form with valid data
    And I click the "Create Patient" button
    Then I should see the patient details page
    And I should see the patient's name, age

  Scenario: Submitting the patient form with invalid data
    Given I am on the new patient page
    When I fill in the patient form with invalid data
    And I click the "Create Patient" button
    Then I should see an error message