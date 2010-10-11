Feature: Create a bill
  In order to keep track of bills
  As a user
  I want to be able to create and add a bill to the system

  Scenario: Add a bill 
    Given I am at the add bill page
    When I add a billing information
    Then I should see the confirmation page
