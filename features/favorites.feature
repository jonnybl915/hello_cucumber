Feature: favoriting a blog post

  Scenario: adding a favorite
    Given I'm a user
    When  I favorite a post
    Then that post is in my favorites
    And I am in the posts' followers
