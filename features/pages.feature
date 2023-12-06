Feature: Navigate between pages via the nav bar

As a user
So that I can navigate between pages

Scenario: Using the nav bar
    Given I am on the home page
    When I click on the "Events" link
    Then I should be on the events page
    When I click on the "Representatives" link
    Then I should be on the representatives page

