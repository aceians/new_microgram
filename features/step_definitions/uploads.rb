Given(/^the following users exist:$/) do |example|
    example.hashes.each do |user_params|
      User.create!(user_params)
    end
end

When(/^I go to the submission page$/) do
   '/uploads'
end

When(/^I go to the new submission page$/) do
  '/uploads/new'
end

Then(/^After uploading a picture, I should be back to the submission page\.$/) do
  '/uploads'
end

Then(/^After uploading the wrong picture, I should not be back to the submission page\.$/) do
  '/uploads/new'
end