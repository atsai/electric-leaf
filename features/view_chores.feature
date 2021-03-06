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
    Given I have logged in as "User A"
    And I have added chore "Run Cucumber tests" for "User A" with deadline "2010-11-08 16:00:00"
		When I visit the page for chore "Run Cucumber tests"
    Then I should see "Title: Run Cucumber tests"
		And I should see "Description:"
		And I should see "User A"
	
	# These are Selenium/Javascript tests
	Scenario: Sort chores by title
	#	Given I have logged in as "User A"
	#	And I have added chore "Run RSpec tests" for "User A" with deadline "2010-11-13 16:00:00"
	#	And I have added chore "Test with Heroku" for "User A" with deadline "2010-11-18 16:00:00"
  # And I have added chore "Run Cucumber tests" for "User A" with deadline "2010-11-08 16:00:00"
  #	And I am on the chores page
	#	When I click on the Title header
	#	Then I should see "Run Cucumber tests" "Run RSpec tests" and "Test with Heroku" in order
		
	Scenario: Sort chores by deadline
	#	Given I have logged in as "User A"
	#	And I have added chore "Run RSpec tests" for "User A" with deadline "2010-11-13 16:00:00"
	#	And I have added chore "Test with Heroku" for "User A" with deadline "2010-11-18 16:00:00"
  # And I have added chore "Run Cucumber tests" for "User A" with deadline "2010-11-08 16:00:00"
  # 	And I am on the chores page
	#	When I click on the Deadline header
	#	Then I should see "Run Cucumber tests" "Run RSpec tests" and "Test with Heroku" in order
	Scenario: Show completed chores
	Scenario: Hide completed chores
	
	Scenario: Check off a chore
		Given I have logged in as "User A"
    And I have added chore "Run Cucumber tests" for "User A" with deadline "2010-11-08 16:00:00"
		When I visit the page for chore "Run Cucumber tests"
		And I press "Check Off"
		Then I should be on the chores page
		And I should see "Keep up the good work!"
