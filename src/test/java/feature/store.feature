Feature: check returned default currency by API

  Background:
         * url 'https://grover-staging.graphcdn.app'
         * header Accept = 'application/json'
  Scenario: get default currency of store
        Given path '/'
        When method post
        Then status 200


