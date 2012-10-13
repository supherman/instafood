Feature: Landing Page

  Scenario: Navigate to the landing page
    When I go to the landing page
    Then I should be on the landing page

  @omniauth
  Scenario: Sign in with twitter
    When I go to the sign in page
    Then I should be logged in

