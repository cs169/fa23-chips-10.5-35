Feature: View and learn about representatives

  As a user of actionmap
  So that I can learn more about elected officials
  I want to be able to search for them effectively

# @load-seed-data
Background:

  Scenario: View a specific representative
    Given there is a representative in the system
    When I visit the representative's page
    Then I should see the details of that representative

  @load-seed-data
  Scenario: Access profile page from search
    Given I am on the representatives page
      When I enter Fairfax County into the search field
      And I click the Search button
      Then I should see a list of 8 representatives

      When I click on the name Joseph R. Biden
      Then I should see information on Joseph R. Biden

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