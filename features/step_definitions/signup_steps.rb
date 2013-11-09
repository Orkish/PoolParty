Given(/^I visit the splash page$/) do 
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











