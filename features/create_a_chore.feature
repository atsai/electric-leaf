Feature: Create a chore
  In order to keep track of chores
  As a user
  I want to be able to add chores to the system

  Scenario: Add a chore
		Given I have logged in as "User A"
		When I go to the new chore page
		And I fill in "title" with "Clean kitchen"
		And I fill in "description" with "Wipe floors."
		And I check "chore_user_ids_"
		And I press "Create"
		#And I follow "redirect"
		Then I should be on the chores page
    And I should see "Chore Clean kitchen has been added for roommates User A."
		And I should see "Clean kitchen"
		And I should see "Wipe floors."

	Scenario: Adding a chore without selecting users
		Given I have logged in as "User A"
		When I go to the new chore page
		And I fill in "title" with "Clean kitchen"
		And I fill in "description" with "Wipe floors."
		And I press "Create"
		Then I should see "You must assign at least one person to this chore."