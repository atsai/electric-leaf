Feature: View chores
  In order to keep track of chores
  As a user
  I want to be able to view all chores assigned

  Scenario: View all chores
    Given I am at the main page
    When I click on the view chores button
    Then I should see a list of all chores assigned to me

  Scenario: View chore details
    Given I am at the chores page
    When I click on a chore
    Then I should see the details of the chore
