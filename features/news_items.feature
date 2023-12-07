Feature: Searching for news items

@load-seed-data
Scenario:
  Given I am on the representatives page
    When I enter "San Francisco" into the search field
    And I click the Search button
    And I click on the article of the first representative
    And I click on the name All Representatives
    Then I should be on the representatives page

    When I enter "San Francisco" into the search field
    And I click the Search button
    And I click on the article of the first representative    
    And I click on the name Add News Article
    And I navigate to edit news article page for representative id 3
  # Then in Representative selection I should see Joseph R. Biden
  # Then in Representative selection I should see Ricardo Lara
  # Then in Representative selection I should see Jimmy Patronis
  # Then in Issue selection I should see Immigration
  # Then in Issue selection I should see Terrorism
  # Then in Issue selection I should see Racism

# Scenario:
  # Given that I am on news items first page for Joseph R. Biden
  # When I select representative as Alex Padilla
  # When I select issue as Immigration
  # When I hit the Search button
  # Then I should now be on the second page for news item search
  # Then I should have Alex Padilla profile link
  # Then I should see issue listed as Immigration
  # Then I should see an article with title Guerrero: Biden can win on immigration by outmaneuvering the xenophobic wing of the GOP
  # Then I should see an article with link https://www.latimes.com/opinion/story/2023-11-06/biden-immigration-parole-republicans-work-permits
  # Then I should see a description with The president could start with work permits for some immigrants in California and other states, then create a parole program for Dreamers and undocumented relatives of U.S. citizens.
  # Then I should see a selection for Rating for 1
  # Then I should see a selection for Rating for 2
  # Then I should see a selection for Rating for 5
  # Then I should see a selection for Rating for 10
  # Then I should see a button named View News Articles
  # When I follow "View News Articles"
  # Then I should see Alex Padilla articles list