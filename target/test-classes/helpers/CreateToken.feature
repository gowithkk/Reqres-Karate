@debug
Feature: Create Token

Scenario: Create Token
    Given url apiUrl
    Given path 'login'
    And request {"email": "#(userEmail)", "password": "#(userPwd)"}
    When method Post
    Then status 200
    * def authToken = response.token
