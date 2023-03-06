
Feature: User Login

    Background: Preconditions
        * url apiUrl

    Scenario: Login - Successful
        Given def userData = {"email": "eve.holt@reqres.in", "password": "cityslicka"}
        Given path 'login'
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

    Scenario Outline: Validate User Login Error Messages
        Given path 'login'
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
            | email                         | password |  errorReponse                            |
            | peter@klaven                  | 123      | {"error":"user not found"}               |
            | peter@klaven                  |          | {"error":"Missing password"}             |
            |                               | 123      | {"error":"Missing email or username"}    |