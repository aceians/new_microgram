Given(/^the following users exist:$/) do |example|
    example.hashes.each do |user_params|
      User.create!(user_params)
    end
end