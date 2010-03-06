Given /^an account for "([^\"]*)"$/ do |email|
  User.make :email => email
end

Given /^I am signed in as "([^\"]*)"$/ do |email|
  When "I go to the log in page"
  And  "I fill in \"Email\" with \"#{email}\""
  And  "I fill in \"Password\" with \"password\""
  And  "I press \"Sign in\""
end

When /^I verify the account for "([^\"]*)"$/ do |email|
  user = User.find_by_email email
  visit new_user_confirmation_url(
        :user_id => user,
        :token   => user.confirmation_token
        )
end
