Given(/^I visit the sign up page$/) do 
  visit '/users/sign_up'
end

# When(/^I click on 'sign-up'$/) do
#   click_button('sign-up')
# end

Given(/^I fill in '(\w+)' for '(\w+)'$/) do |word1, field1|
  fill_in field1, :with => word1
end

Given(/^I fill in '(test@test.com)' for '(user_email)'$/) do |word2, field2|
  fill_in field2, :with => word2
end

When(/^I press 'Sign up'$/) do
  click_button('Sign up')
end

Then(/^I should see '(Welcome! You have signed up successfully.)' as the greeting$/) do |greeting|
  assert find('#notice').text == greeting
end

When(/^I click 'Sign Out'$/) do
  click_link('Sign Out')
end

Then(/^I should see '(Signed out successfully.)' as the message$/) do |message|
  assert find('#notice').text == message
end

Given(/^I visit the sign in page$/) do
  visit '/users/sign_in'
end

When(/^I press 'Sign in'$/) do
  click_button('Sign in')
end

Then(/^I should see '(Welcome!)' as the message$/) do |message|
  assert find('#notice').text == message
end