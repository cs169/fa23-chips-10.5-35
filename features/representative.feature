Feature: View and learn about representatives

  As a user of actionmap
  So that I can learn more about elected officials
  I want to be able to search for them effectively

Background:

  Scenario: View a specific representative
    Given there is a representative in the system
    When I visit the representative's page
    Then I should see the details of that representative

  Scenario: Access profile page from search
    Given I visit the search page
    When I search for Fairfax County
    When I click on Joseph R. Biden's link in the search results
    Then I should see Joseph R. Biden's information

  Scenario: get Dan Sullivan info
    When I am on the home page
    When I click on state "AK"
    Then I should see "Alaska"
    Then I should see "Counties in Alaska"
    When I press "Counties in Alaska"
    Then I should see "Aleutians East Borough"
    When I click on county "Yukon Koyukuk Census Area"
    Then I should see "Dan Sullivan"
    When I follow "Dan Sullivan"
    Then I should see "302 Hart Senate"