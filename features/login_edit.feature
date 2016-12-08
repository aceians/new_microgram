Feature: Users can edit their profile information
As a Researcher or student
I want to change the profile information
So that I can see new information

Background: users in database
 
  Given the following users exist:
  | name  | email                | individualrole | org  | dept |  password   |
  | denny | dennydenny@tamu.edu  | Researcher     | tamu | cs   |  123456     |
  | katie | katie@tamu.edu       | Researcher     | tamu | cs   |  234567     |

Scenario: Change information
Given I am on the Microgram home page
When I go to the Log in page
And I go to the settings
And I change name
Then After saving changes, I should be the home page

Scenario: Fail to change information (sad path)
Given I am on the Microgram home page
When I go to the Log in page
And I go to the settings
And I do not type "@" with :email
Then After saving changes, I should not be the home page