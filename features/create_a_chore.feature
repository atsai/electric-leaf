Feature: Create a chore
  In order to keep track of chores
  As a user
  I want to be able to add chores to the system

  Scenario: Add a chore 
    Given I am at the add chore page
    When I add chore details
    Then I should see the confirmation page
