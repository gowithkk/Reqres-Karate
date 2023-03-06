
Feature: Users

    Background: Define URL
        * url apiUrl

    Scenario: List Users
        Given params { page: 2}
        Given path 'users'
        When method Get
        Then status 200
        And match each response.data ==
        """
            {
                "id": "#number",
                "email": "#string",
                "first_name": "#string",
                "last_name": "#string",
                "avatar": "#string"
            }
        """

    Scenario: List a Single User
        Given path 'users/2'
        When method Get
        Then status 200
        And match response ==
        """
            {
                "data": {
                    "id": "#number",
                    "email": "#string",
                    "first_name": "#string",
                    "last_name": "#string",
                    "avatar": "#string"
                },
                "support": {
                    "url": "#string",
                    "text": "#string"
                }
            }
        """

        
    Scenario: List a Non-exisitng User
        Given path 'users/23'
        When method Get
        Then status 404


    Scenario: Create a User
        Given def userData = {"name": "morpheus", "job": "leader"}
        * def timeValidator = read('classpath:helpers/timeValidator.js')      
        Given path 'users'
        And request
        """
            {
                "name": "morpheus",
                "job": "leader"
            }
        """
        When method Post
        Then status 201
        And match response ==
        """
            {
                "name": "#string",
                "job": "#string",
                "id": "#string",
                "createdAt": "#? timeValidator(_)"
            }
        """

    
    Scenario: Update a User's info using Put
        Given def userData = {"name": "morpheus", "job": "zion resident"}
        Given path 'users/2'
        And request
        """
            {
                "name": "morpheus",
                "job": "zion resident"
            }
        """
        When method Put
        Then status 200
        And match response.job == userData.job
        
    
    Scenario: Update a User's info using Patch
        Given def userData = {"name": "morpheus", "job": "zion resident"}
        Given path 'users/2'
        And request
        """
            {
                "name": "morpheus",
                "job": "zion resident"
            }
        """
        When method Patch
        Then status 200
        And match response.job == userData.job
    

    Scenario: Delete a User
        Given path 'users/2'
        When method Delete
        Then status 204

    
    Scenario: Retry call
        * configure retry = { count: 10, interval: 4000 }
        Given params { delay: 3 }
        Given path 'users'
        And retry until response.support.url == "https://reqres.in/#support-heading" 
        When method Get
        Then status 200
        