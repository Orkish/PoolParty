Given(/^I visit the splash page$/) do
	visit '/users/sign_in'
end

And(/^I fill in '(test@test.com)' for '(user_email)'$/) do |text1, field1|
	fill_in field1, :with => text1
end

And(/^I fill in '(password)' for '(user_password)'$/) do |text2, field2|
	fill_in field2, :with => text2
end

When(/^I press 'Sign in'$/) do
  click_button('Sign in')
end

Then(/^I should see '(\w+)' as the 'greeting'$/) do |greeting|
	assert find('#').text == greeting
end