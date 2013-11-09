Feature: Sign In
	In order to to gain access to the full website and its functionalities
  As a returning visitor wanting to use Pool Party
  I want to be able to sign in.

	Scenario: Returning Visitor
		Given I visit the splash page
		And I fill in the sign in form
		When I click on 'sign-in'
		Then I should be redirected to the profile page
		Then I should see 'Welcome, user!'
