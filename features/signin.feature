Feature: Sign In
	In order to to gain access to the full website and its functionalities
  As a returning visitor wanting to use Pool Party
  I want to be able to sign in.

	Scenario: Returning Visitor
		Given I visit the splash page
		Given I fill in 'test@test.com' for 'user_email'
		Given I fill in 'password' for 'user_password'
		When I press 'Sign in'
		Then I should see 'Welcome, user!' as the 'greeting'
