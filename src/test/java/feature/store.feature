Feature: check returned default currency by API

  Background:
    * url 'https://grover-staging.graphcdn.app'


  Scenario: get status code 400
        Given url 'https://grover-staging.graphcdn.app/'
        And header Accept = 'application/json'
        When method post
        Then status 400

  Scenario: get status code 400
    Given url 'https://grover-staging.graphcdn.app/'
    And header Accept = 'application/graphql'
    When method post
    Then status 400

  Scenario: get status code 500 INTERNAL_SERVER_ERROR
    Given url 'https://grover-staging.graphcdn.app/'
    Given text query =
    """
    query store ($id: ID, $storeCode: String) {
    store (id: $id, storeCode: $storeCode) {
        alternativeLocales
        code
        defaultCurrency
        defaultLocale
    }
  }
    """
    And request { query : '#(query)'}

    When method post
    Then status 200
    Then match $ == '#object'

  Scenario: get status code 200 OK
    Given url 'https://grover-staging.graphcdn.app/'
    Given def query = read('storeQuery.graphql')
    And def variables = { id: 4, storeCode: 'ES' }
    And request { query : '#(query)', variables: '#(variables)'}
    When method post
    * print response
    Then status 200