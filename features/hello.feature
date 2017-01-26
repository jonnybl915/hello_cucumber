Feature: using cucumber

  Scenario: adding two numbers
    Given I have 2
    And I add 2
    Then I should have 4


  Scenario: adding three numbers
    Given I have 3
    And I add 7
    And I add 3
    Then I have 13
