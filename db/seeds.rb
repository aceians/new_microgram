# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "test@test.com",
             individualrole: "Student",
             org: "tamu",
             dept: "cs",
             password:              "testtest",
             password_confirmation: "testtest")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@microgram.org"
  individualrole = "Student"
  org = "tamu-#{n+1}"
  dept = "cs-#{n+1}"
  password = "password"

  User.create!(name:  name,
               email: email,
               individualrole: individualrole,
               org: org,
               dept: dept,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(80)
uploads = Upload.order(:created_at).take(10)
#imageid = "#{email}_#{c+1}"
#subid = "#{imageid}_#{d+1}"
#permission1 = "Public"
#permission2 = "Private"
#permission3 = "Protected"
#a=0
50.times do
#  a = a+1
  description = Faker::Lorem.sentence(5)
  permission = "Public"
  tag = Faker::Lorem.word
  users.each { |user| user.uploads.create!(description: description) }
  uploads.each { |upload| upload.tags.create!(tagname: tag, permission: permission) }
end