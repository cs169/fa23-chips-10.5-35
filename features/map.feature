Feature: Clicking between states and county

    As a user
    So that I can see the representatives of a county 
    I want to be able to click on a state, then a county, and see the representatives

# Scenario: movies, counties, and representatives added to the database
#     Given the following states exist
#     | name       | symbol | fips_code | is_territory | lat_min     | lat_max     | long_min  | long_max    |
#     | California | CA     | 06        | 0            | -124.409591 | -114.131211 | 32.534156 | -114.131211 |
#     | New Jersey | NJ     | 34        | 0            | -75.559614  | -73.893979  | 38.928519 | -73.893979  |
#     | Hawaii     | HI     | 15        | 0            | -178.334698 | -154.806773 | 18.910361 | -154.806773 |
#     And I am on the home page
#     Then 3 seed states should exist

@load-seed-data
Scenario: Clicking on Alameda county
  Given I am on the home page
  When I click on the CA state
#   And I click on the Counties in California button
#   Then I should see a list of counties

  When I click on the county with name "Alameda County"
  Then I should see a list of representatives
