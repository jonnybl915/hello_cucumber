Given(/^I have (\d+)$/) do |number|
  @number = number.to_i
end

And(/^I add (\d+)$/) do |addition|
  @number += addition.to_i
end

Then(/^I should have (\d+)$/) do |result|
  expect(@number).to eq result.to_i
end