Feature: Menu

  @javascript @omniauth
  Scenario: Be able to add a menu item to the order
    Given I am logged in
      And There are a menu item
      And I am on the menu page
     When I select a menu item
     Then I should see the menu item modal

  @javascript @omniauth
  Scenario: Add a simple menu item
    Given There are a menu item
      And I am logged in
     When I select a menu item
      And I add that item to my order
     Then I should see the menu item in the order description

  @javascript @omniauth
  Scenario: Add a menu item with variations
    Given There are a menu item with variations
      And I am logged in
     When I select a menu item
      And I add a variation to my order
     Then I should see the menu item in the order description

