Feature: Add a roommate
  In order to share chores and bills with roommates
  As a user
  I want to be able to add roommates to my residence

  Scenario: Add User B as a roommate
		Given I have logged in as "User A"
		And I am on User A's add roommate page
		When I fill in "roommate_email" with "b@test.com"
		And I press "Submit"
		Then I should be on the home page
    And I should see "User B has been notified of your request."

	Scenario: Add an unregistered user as a roommate
		Given I have logged in as "User A"
		And I am on User A's add roommate page
		When I fill in "roommate_email" with "randomdude@test.com"
		And I press "Submit"
		Then I should be on User A's add roommate page
		And I should see "Please ask your roommate to log in once before adding him/her."

	Scenario: Add self as a roommate
		Given I have logged in as "User A"
		And I am on User A's add roommate page
		When I fill in "roommate_email" with "a@test.com"
		And I press "Submit"
		Then I should be on User A's add roommate page
		And I should see "You cannot add yourself as a roommate."

	Scenario: Add User B, who already has a pending request
		Given I have logged in as "User A"
		And a roommate request is pending for "User B" from "User C"
		And I am on User A's add roommate page
		When I fill in "roommate_email" with "b@test.com"
		And I press "Submit"
		Then I should be on User A's add roommate page
		And I should see "This user already has a pending roommate request."
		
	Scenario: View roommate request
		Given I have logged in as "User A"
		And a roommate request is pending for "User A" from "User B"
		When I go to the home page
		Then I should see "User B wants to add you as a roommate!"

	Scenario: Accept a roommate request
		Given I have logged in as "User A"
		And a roommate request is pending for "User A" from "User B"
		And I am on the home page
		When I follow "Accept"
		Then I should see "You have been added to User B's residence!"
		
	Scenario: Deny a roommate request
		Given I have logged in as "User A"
		And a roommate request is pending for "User A" from "User B"
		And I am on the home page
		When I follow "Deny"
		Then I should see "You have denied User B's request."
