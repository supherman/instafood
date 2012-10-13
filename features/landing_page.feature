Feature: Landing Page

  Scenario: Navigate to the landing page
    When I go to the landing page
    Then I should be on the landing page

  Scenario: Add menu item when not logged
    Given I am on the landing page
     When I create a new order from the landing page
     Then I should be on the menu page

