Given(/^I'm a user$/) do
 @user = User.create!(email: 'jon@example5.com', password: 'password')
end

When(/^I favorite a post$/) do
  @post = Post.create(title: 'hello-cucumber', body: 'blal;')
  @user.add_favorite(@post)
end

Then(/^that post is in my favorites$/) do
  expect(@user.favorite_posts.include?(@post)).to eq true
end

And(/^I am in the posts' followers$/) do
  expect(@post.followers.include?(@user)).to eq true
end

Given(/^I'm logged in$/) do
  @user = User.create! email: 'a@b.com', password: 'pass'
  
  visit '/users/sign_in'
  fill_in 'user_email', with: 'a@b.com'
  fill_in 'user_password', with: 'pass'
  click_on 'Sign in'
  
end

And(/^I'm viewing "([^"]*)"$/) do |title|
  post = Post.create! title: title
  visit "/posts/#{post.id}"
  
  click_on '#add_favorite'
  
end

When(/^I click the favorite button$/) do
  # Model
  expect(@user.favorites).to include? @post
  
  #view
  visit '/dashboard'
  expect(page).to have_content title
end

Then(/^"([^"]*)" should show up in my favorites$/) do |arg|
  pending
end