Feature: check returned jokes by API

  Background:
      * url 'https://api.chucknorris.io'
  Scenario: get list of jokes
      Given path '/jokes/random'
      When  method get
      Then  status 200