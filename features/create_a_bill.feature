Feature: Create a bill
  In order to keep track of bills
  As a user
  I want to be able to create and add a bill to the system

  Scenario: Add a bill 
		Given I have logged in as "User A"
		When I go to the new bill page
		And I fill in "title" with "Comcast bill"
		And I fill in "amount" with "88.88"
		And I check "bill_user_ids_"
		And I press "Create"
    Then I should see "Bill was successfully created."
		And I should see "Comcast bill"
		And I should see "88.88"

	Scenario: Adding a bill without selecting users
		Given I have logged in as "User A"
		When I go to the new bill page
		And I fill in "title" with "Comcast bill"
		And I fill in "amount" with "88.88"
		And I press "Create"
		Then I should see "You must assign at least one person to this bill."