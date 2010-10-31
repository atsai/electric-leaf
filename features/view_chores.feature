Feature: View chores
  In order to keep track of chores
  As a user
  I want to be able to view chores assigned

  Scenario: View all chores
		Given I have logged in as "User A"
    And I have added chore "Run Cucumber tests" for "User A" with deadline "2010-11-08 16:00:00"
		And I have added chore "Run RSpec tests" for "User A" with deadline "2010-11-13 16:00:00"
		And I have added chore "Test with Heroku" for "User A" with deadline "2010-11-18 16:00:00"
    When I go to the chores page
    Then I should see chore "Run Cucumber tests" for "User A" with deadline "2010-11-08 16:00:00"
		And I should see chore "Run Cucumber tests" for "User A" with deadline "2010-11-13 16:00:00"
		And I should see chore "Run Cucumber tests" for "User A" with deadline "2010-11-18 16:00:00"

  Scenario: View chore details
    Given I am on the chores page
    When I click on a chore
    Then I should see the details of the chore
