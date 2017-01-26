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