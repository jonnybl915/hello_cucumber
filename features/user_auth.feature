Feature: authenticating users

  Scenario: signing up for new account
    Given I am on the sign up page
    When try mismatched passwords
    Then I should be on the sign up page
    And I should see that my passwords do not match

  Scenario: signing up for new account
    Given I do not have an account
    And I am on the sign up page
    When I register as jon@example.com
    Then I should be on the home page
    And I should have a user account

  Scenario: registering a taken email address
    Given user@example.com has an account
    And I should be on the sign up page
    When I register as user@example.com
    Then I should be on the sign up page
    And I should see that the email is taken
    And there should be no new user account created
