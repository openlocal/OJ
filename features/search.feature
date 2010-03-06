@no-txn
Feature: Searching for Job Requests
  In order to find projects I want to volunteer for
  As a user
  I want to search for projects by given categories and locations
  
  Scenario: Searching by title
    Given a job request "Mow my Lawn"
    And a job request "Wash my Car"
    And the job_request indexes are processed
    When I go to the home page
    And I fill in "Search" with "Lawn"
    And I press "Search"
    Then I should see "Mow my Lawn"
    And I should not see "Wash my Car"
  
  Scenario: Searching by Category
    Given a job request "Mow my Lawn" with the "Gardening" category
    And a job request "Wash my Car" with the "Auto" category
    And the job_request indexes are processed
    When I go to the home page
    And I fill in "Search" with "Auto"
    And I press "Search"
    Then I should see "Wash my Car"
    And I should not see "Mow my Lawn"  
    
  Scenario: Searching by Description
    Given a job request "Mow my Lawn" described as "in need of trim"
    And a job request "Wash my Car" described as "in need of shampoo"
    And the job_request indexes are processed
    When I go to the home page
    And I fill in "Search" with "trim"
    And I press "Search"
    Then I should see "Mow my Lawn"
    And I should not see "Wash my Car"  
    
  Scenario: Searching by Location
    Given a job request "Mow my Lawn" in "Sydney"
    And a job request "Wash my Car" in "Bondi"
    And the job_request indexes are processed
    When I go to the home page
    And I fill in "Search" with "Sydney"
    And I press "Search"
    Then I should see "Mow my Lawn"
    And I should not see "Wash my Car"
