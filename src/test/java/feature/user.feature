Feature: check returned user by API

  Background:
    * url 'https://gorest.co.in'
    * header Authorization = 'Bearer Token'
  Scenario: get list of users having name with john
    Given path '/public-api/users'
    And param firstname = 'John
    When method get
    Then status 200