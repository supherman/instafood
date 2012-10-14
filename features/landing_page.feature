Feature: Landing Page

  Scenario: Navigate to the landing page
    When I go to the landing page
    Then I should be on the landing page

  Scenario: Create an order
    Given I am on the landing page
     When I create a new order from the landing page
     Then I should be on the menu page

  @javascript
  Scenario: Add a menu item without login
    Given There are menu items
      And I am on the landing page
     When I add a menu item to my order
     Then I should be on the menu page
      And I should see the twitter sign in modal

