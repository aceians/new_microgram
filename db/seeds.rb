# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "sample2@microgram.org",
             password:              "tamutamu",
             password_confirmation: "tamutamu")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@microgram.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  description = Faker::Lorem.sentence(5)
  users.each { |user| user.uploads.create!(description: description) }
end