Given(/^I do not have an account$/) do
  pending
end

And(/^I am on the sign up page$/) do
  visit '/users/sign_up'
end

# When(/^I create a new account$/) do
#   fill_in '#user_email', with: 'jon@example.com'
#   fill_in '#user_password', with: 'password'
#   fill_in '#user_password_confirmaton', with: 'password'
#   click_on 'Sign up'
# end

When(/^I register as (\S+)$/) do |email|
  save_and_open_page
  fill_in '#user_email', with: email
  fill_in '#user_password', with: 'password'
  fill_in '#user_password_confirmaton', with: 'password'
  click_on 'Sign up'
end

Then(/^I should be on the home page$/) do
  expect(page.has_content?('Home Page!')).to eq true
  save_and_open_page
end

# And(/^I should see my email$/) do
#   expect(page).to have_content 'jon@example.com'
# end

And(/^I should have a user account$/) do
  expect(User.where(email: 'james@example.com').count).to eq 1
  expect(page).to have_content 'jon@example.com'
end

When(/^try mismatched passwords$/) do
  fill_in 'user_email', with: 'jon@example.com'
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'passasdword'
  click_on 'Sign up'
end

Then(/^I should be on the sign up page$/) do
  expect(page).to have_content 'Sign up'
end

And(/^I should see that my passwords do not match$/) do
  expect(page).to have_content "Passwords don't match"
end


Given(/^(\S+) has an account$/) do |email|
  User.create!(email: email, password: 'password')
end

And(/^I should see that the email is taken$/) do
  expect(page).to have_content 'Email has already been taken'
end


And(/^there should be no new user account created$/) do
  expect(User.count).to eq 1
end