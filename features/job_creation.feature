Feature: Creating New Jobs
  In order to give people something to do
  As a user
  I want to create jobs on the site

  Scenario: Creating Jobs without an account
    When I go to the home page
    And I follow "I Want Help"
    And I fill in "Title" with "Wash My Car"
    And I fill in "Description" with "It's pretty muddy."
    And I fill in "Your Name" with "Pat"
    And I fill in "Email" with "pat@allan.com"
    And I fill in "Duration" with "3"
    And I press "Ask for Help"
    Then I should see "Please check your email"
    And I should have 1 email from Two Bob's Worth
  
  Scenario: Creating Jobs with an account when not signed in
    Given an account for "pat@allan.com"
    When I go to the home page
    And I follow "I Want Help"
    And I fill in "Title" with "Wash My Car"
    And I fill in "Description" with "It's pretty muddy."
    And I fill in "Your Name" with "Pat"
    And I fill in "Email" with "pat@allan.com"
    And I fill in "Duration" with "3"
    And I press "Ask for Help"
    Then I should see "Please log in"
  
  Scenario: Creating Jobs with an account when signed in
    Given an account for "pat@allan.com"
    And I am signed in as "pat@allan.com"
    When I go to the home page
    And I follow "I Want Help"
    And I fill in "Title" with "Wash My Car"
    And I fill in "Description" with "It's pretty muddy."
    And I fill in "Duration" with "3"
    And I press "Ask for Help"
    Then I should see "Organisation name"
    
  Scenario: Confirming new jobs when verified account
    Given a pending job "Wash My Car" by "pat@allan.com"
    When I verify the account for "pat@allan.com"
    And I log out
    And I go to the job page for "Wash My Car"
    Then I should see "I want to help"
      
  
