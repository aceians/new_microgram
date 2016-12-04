Given(/^I am on the Microgram home page$/) do
    visit "/"
end

When(/^I go to the Log in page$/) do
  '/login'
end

When(/^After logging in, I am on my profile page$/) do
    '/users/:id'
end

When(/^After typing the wrong email and password, I should be on the Log in page$/) do
    '/users/new'
end

When(/^I should go to signup page$/) do
   '/signup'
end


When(/^I follow "([^"]*)"$/) do |text|
    page.should have_content(text)
end


Then(/^I should be on the Log in page$/) do
  '/users/new'
end

Then(/^I press "([^"]*)"$/) do |text|
  page.should have_content(text)
end

Then(/^After creating, I should be back on the Log in page$/) do
    '/users/new'
end

#new scenario


Given(/^I am on the sign up page$/) do
 '/signup'
end

When(/^I do not type "([^"]*)" with :email$/) do |text|
    page.should not(have_content(text))
end


Then(/^The Sign up page should not move on$/) do
  '/signup'
end

Then(/^After typing my email and password, I press "([^"]*)"$/) do |text|
      page.should have_content(text)
end

Then(/^I am on my profile page$/) do
   '/users/:id'
end

Then(/^After typing the wrong email and password, I press "([^"]*)"$/) do |text|
     page.should have_content(text)
end
