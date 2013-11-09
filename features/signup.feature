Feature: Sign Up
	In order to to gain access to the full website and its functionalities
  As a new visitor wanting to use Pool Party
  I want to be able to sign up.

	Scenario: New Visitor
		Given I visit the splash page
		When I click on 'sign-up'
		And I fill in 'test' for 'user_firstname'
		And I fill in 'test' for 'user_lastname'
		And I fill in 'test' for 'user_username'
		And I fill in 'test@test.com' for 'user_email'
		And I fill in '1234567890' for 'user_phone'
		And I fill in 'password' for 'user_password'
		And I fill in 'password' for 'user_password_confirmation'
		When I click on submit
		Then I should be redirectd to the profile page 
		Then I should see 'Welcome, user!'
    