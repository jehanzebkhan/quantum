@javascript
Feature: Manage Store
  We need a list of stores so that we can manage where we buy our products from.

  Scenario: List of Stores
    Given the following store exist
      | name          |
      | Aldi          |
      | Woolworth     |
      | Coles         |
    When I go to stores
    Then I should see stores table
      | name          |
      | Aldi          |
      | Coles         |
      | Woolworth     |
