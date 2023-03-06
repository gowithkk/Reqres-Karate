
@parallel=false
Feature: Register new user

    Background: Preconditions
        * url apiUrl

    Scenario: New User Registration
        Given def userData = {"email": "eve.holt@reqres.in", "password": "pistol"}
        Given path 'register'
        And request
        """
            {
                "email": #(userData.email),
                "password": "#(userData.password)",
            }
        """

        When method Post
        Then status 200
        And match response ==
        """
            {
                "token": "#string"
            }
        """
    
    Scenario Outline: Validate User Registration Error Messages
        Given path 'register'
        And request
        """
            {
                "email": "<email>",
                "password": "<password>"
            }
        """

        When method Post
        Then status 400
        And match response == <errorReponse>

        Examples:
            | email                         | password |  errorReponse                                             |
            | eve.holt@reqres.in            |          | {"error":"Missing password"}                              |
            |                               | 123      | {"error":"Missing email or username"}                     |
            | eve.holt                      | 123      | {"error":"Note: Only defined users succeed registration"} |