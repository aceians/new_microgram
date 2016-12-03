Feature: Users can upload pictures
As a Researcher
I want to upload a picture with Microgram
So that I can see a picture

Background: users in database
 
  Given the following users exist:
  | name  | email                | individualrole | org  | dept |  password   |
  | denny | dennymrh@tamu.edu    | Researcher     | tamu | cs   |  123456     |


Scenario: Upload a picture 
When I go to the submission page 
And I press "New Submission"
And  I upload a picture and press "Submit"
Then 

Scenario:  (sad path)



