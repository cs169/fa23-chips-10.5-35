Feature: Login with GitHub or Google

As a user
So that I can login via Google or Github

Scenario: Login with Google
    Given I am on the login page
    When I login with Google
    Then I should be redirected to the home page

Scenario: Login with GitHub
    Given I am on the login page
    When I login with GitHub
    Then I should be redirected to the home page

# Scenario: Already logged in
    # Given I am logged in with Google
    # When I go to the login page
    # Then I should be redirected to the user profile page

#     Given I am logged in with GitHub
#     When I go to the login page
#     Then I should be redirected to the user profile page

# Scenario: User can Logout
#     Given I am logged in
#     When I go to the logout page
#     Then I should be redirected to the home page
