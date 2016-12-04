When(/^I go to the settings$/) do
    '/users/:id/edit'
end

When(/^I change name$/) do
  '/users/:id/edit'
end

Then(/^After saving changes, I should be the home page$/) do
  visit "/"
end

Then(/^After saving changes, I should not be the home page$/) do
 '/users/:id/edit'
end
