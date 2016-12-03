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
  if (n%2 == 0)
    individualrole = "Student"
  else
    individualrole = "Researcher"
  end
  
  org = "tamu-#{n+1}"
  dept = "cs-#{n+1}"
  password = "testtest"

  User.create!(name:  name,
               email: email,
               individualrole: individualrole,
               org: org,
               dept: dept,
               password:              password,
               password_confirmation: password)
end

users = Array.new
20.times do |a|
users << User.find(a+1)
end

temp = 1

2.times do
users.each do |tuser|
if (temp%3 == 0)
    permission = "Public"
elsif (temp%3 == 1)
    permission = "Private"
else
    permission = "Protected"
end
description = Faker::Lorem.sentence
url = Faker::Internet.url
user_id = tuser.id
tuser.uploads.create!(user_id: user_id,
                  permission: permission,
                  description: description,
                  url: url)
temp = temp + 1
end
end

submissions = Array.new
submissions = Upload.all

submissions.each do |id|
    5.times do
        id.images.create!(image: Faker::Avatar.image)
    end
    6.times do
        id.tags.create!(tagname: Faker::Lorem.word)
    end
    
    if id.permission == "Protected"
    temp2 = 2
    3.times do
        if temp2 < 80
            2.times do
                id.protections.create!(sharedid: User.find(temp2).email)
                temp2 = temp2*2
                temp2 = temp2-1
            end
        else
            temp2 = 1
        end
    end
    end


end
    
