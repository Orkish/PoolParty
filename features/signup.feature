Feature: Sign Up
	In order to to gain access to the full website and its functionalities
  As a new visitor wanting to use Pool Party
  I want to be able to sign up.

	Scenario: New Visitor
		Given I visit the sign up page
		And I fill in 'test' for 'user_firstname'
		And I fill in 'test' for 'user_lastname'
		And I fill in 'test' for 'user_username'
		And I fill in '1234567890' for 'user_phone'
		And I fill in 'password' for 'user_password'
		And I fill in 'password' for 'user_password_confirmation'
		And I fill in 'test@test.com' for 'user_email'
		When I press 'Sign up'
		Then I should see 'Welcome! You have signed up successfully.' as the greeting
    When I click 'Sign Out'
    Then I should see 'Signed out successfully.' as the message
    Given I visit the sign in page
    And I fill in 'test@test.com' for 'user_email'
    And I fill in 'password' for 'user_password'
    When I press 'Sign in'
    Then I should see 'Welcome!' as the message