Feature: Job Completion
  In order to provide feedback on jobs and offers
  As a job requester
  I want to provide feedback and thank the volunteer
  
  Scenario: Thanking a completed volunteer effort
    Given an account for "pat@allan.com"
    And a job "Mow my Lawn" by "pat@allan.com" with an accepted offer
    And I am signed in as "pat@allan.com"
    When I go to the job page for "Mow my Lawn"
    And I follow "Mark as Completed"
    And I select "4" from "Rating"
    And I fill in "Feedback" with "Wonderful work!"
    And I fill in "Actual Duration" with "6"
    And I press "Save Feedback"
    Then I should see "Feedback received"
  
