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

  Scenario: New Store
    Given I am on the add new store
    When I fill out the form with the following attribute
      | name | Safeway |
    And I press Save
    Then I should see stores table
    | name    |
    | Safeway |
