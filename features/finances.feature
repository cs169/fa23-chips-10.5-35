Feature: Search Campaign Finances

As a user
So that I can see how more information about a campaign

@load-seed-data
Scenario: Home page to campaign finances
  Given I am on the home page
  When I click on the "Campaign Finances" link
  Then I should be on the finances page

  Given I am on the finances page
  When I select the 2012 cycle
  And I select the Candidate Loan category
  And I click the Search button
  Then I should see "Top 20 Candidates for Candidate Loan in 2012"
