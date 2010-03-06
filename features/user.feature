Feature: Handling User Accounts
  In order to make the most of the site
  As a user
  I want manage my account details
  
  Scenario: View Open Jobs when Confirming Account
    Given a pending job "Wash My Car" by "pat@allan.com"
    And a pending job "Mow My Lawn" by "pat@allan.com"
    When I verify the account for "pat@allan.com"
    Then I should see "Wash My Car"
    And I should see "Mow My Lawn"
  
