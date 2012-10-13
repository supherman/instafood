Feature: Sign in

  @omniauth
  Scenario: Sign in with twitter
    When I go to the sign in page
    Then I should be logged in
