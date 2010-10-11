Feature: View roommate debts
  In order to keep track of roommate debts
  As a user
  I want to be able to view debt amounts of other roommates 

  Scenario: View all debts 
    Given I am at the main page
    When I click on the view debts button
    Then I should see a list of all roommates with associated debt amounts

  Scenario: View debt details
    Given I am at the debt page
    When I click on a roommate name
    Then I should see the details of the debt 
