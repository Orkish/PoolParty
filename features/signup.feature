Feature: Sign Up
	In order to to gain access to the full website and its functionalities
  As a new visitor wanting to use Pool Party
  I want to be able to sign up.

	Scenario: New Visitor
		Given I visit the splash page
		When I click on 'sign-up'
		And I fill in the sign up form
		When I click on submit
		Then I should be redirectd to the profile page 
		Then I should see 'Welcome, user!'
    