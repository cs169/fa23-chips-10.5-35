Feature: display a list of representatives by searching some address

@load-seed-data
Scenario: User enters an address and clicks search
  Given I am on the representatives page
    When I enter "San Francisco" into the search field
    And I click the Search button
    Then I should see a list of 26 representatives

    When I click on the artilce of the first representative
    Then I should get news items for the first representative