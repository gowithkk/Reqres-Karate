
Feature: Resources

    Background: Define URL
        * url apiUrl

    Scenario: List Resources
        Given path 'unkonwn'
        When method Get
        Then status 200
        And match each response.data ==
        """
            {
                "id": "#number",
                "name": "#string",
                "year": "#number",
                "color": "#string",
                "pantone_value": "#string"
            }
        """

    Scenario: List a Single Resource
        Given path 'unkonwn/2'
        When method Get
        Then status 200
        And match response ==
        """
        {
            "data": {
                "id": "#number",
                "name": "#string",
                "year": "#number",
                "color": "#string",
                "pantone_value": "#string"
            },
            "support": {
                "url": "#string",
                "text": "#string"
            }
        }
        """

    Scenario: List a Non-exisitng Resource
        Given path 'unkonwn/23'
        When method Get
        Then status 404