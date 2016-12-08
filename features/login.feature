Feature: Users can log in
As a Researcher
I want to log in with the existing account
So that I can see my data

Scenario: Log in Successfully
Given I am on the Microgram home page
When I go to the Log in page
And After logging in, I am on my profile page

Scenario: Wrong Log in (sad path)
Given I am on the Microgram home page
When I go to the Log in page
And After typing the wrong email and password, I should be on the Log in page 