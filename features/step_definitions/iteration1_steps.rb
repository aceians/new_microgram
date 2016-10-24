Given(/^I am on the Microgram home page$/) do
    visit "/"
end

When(/^I follow "([^"]*)"$/) do |text|
  assert page.has_content?(text)
end

Then(/^I should be on the new account page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end