Feature: Users can create accounts
As a Researcher
I want to have an user account with Microgram
So that I have an account

Scenario: Create an account
Given I am on the Microgram home page
When I go to the Log in page
And I should go to signup page
And After creating, I should be back on the Log in page


Scenario: Fill in the wrong form (sad path)
Given I am on the sign up page
When I do not type "@" with :email
Then The Sign up page should not move on