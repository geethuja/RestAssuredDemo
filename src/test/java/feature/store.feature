Feature: check returned default currency by API

  Background:
         * url 'https://grover-staging.graphcdn.app'
         * header Accept = 'application/json'

  Scenario: get status code 400
        Given url 'https://grover-staging.graphcdn.app/'
        And header Accept = 'application/json'
        When method post
        Then status 400

  Scenario: get status code 200 OK
    Given url 'https://grover-staging.graphcdn.app/'
    And header Accept = 'application/graphql'
    When method post
    Then status 400
