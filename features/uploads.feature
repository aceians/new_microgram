Feature: Users can upload pictures
As a Researcher
I want to upload a picture with Microgram
So that I can see a picture

Background: users in database
 
  Given the following users exist:
  | name  | email                | individualrole | org  | dept |  password   |
  | denny | dennydenny@tamu.edu  | Researcher     | tamu | cs   |  123456     |
  | katie | katie@tamu.edu       | Researcher     | tamu | cs   |  234567     |

Scenario: Upload a picture 
Given I am on the Microgram home page
When I go to the Log in page
And I go to the submission page 
And I go to the new submission page
Then After uploading a picture, I should be back to the submission page.

Scenario: Fail to upload a picture (sad path)
Given I am on the Microgram home page
When I go to the Log in page
And I go to the submission page 
And I go to the new submission page
Then After uploading the wrong picture, I should not be back to the submission page.


