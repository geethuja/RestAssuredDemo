Feature: check returned jokes by API

  Background:
      * url 'https://api.chucknorris.io'

  Scenario: get random jokes API and status code 200 OK from Chuck Norris
      Given path '/jokes/random'
      When  method get
      Then  status 200
      And def jsonResponse = response
      And print jsonResponse
      Then match jsonResponse.icon_url  contains 'https://assets.chucknorris.host/img/avatar/chuck-norris.png'
      Then match jsonResponse == { categories:'#ignore' , created_at: '#notnull' ,icon_url:'#notnull', id :'#notnull'  ,updated_at: '#notnull' ,url: '#notnull', value: '#notnull' }

    Scenario: verify status code 404 from https://api.chucknorris.io/jokes/random
        Given url 'https://api.chucknorris.io/jokes/random'
        And path '/123'
        When method get
        Then status 404
        And  match response.error  contains 'Not Found'

  Scenario: Validate the response data from https://api.chucknorris.io/jokes/random
      Given url baseUrl + '/jokes/random'
      When  method get
      Then  status 200
      And def jsonResponse = response
      * print jsonResponse
      * def actualIcon_url=jsonResponse.icon_url
      * print actualIcon_url
      * def actualCreated_at=jsonResponse.created_at
      * def actualId=jsonResponse.id
      * def actualUpdated_at=jsonResponse.updated_at
      * def actualUrl=jsonResponse.url
      * def actualValue=jsonResponse.value
      * match actualIcon_url == 'https://assets.chucknorris.host/img/avatar/chuck-norris.png'
      * match actualCreated_at == '2020-01-05 13:42:21.455187'
      * match actualId == 'Vk2HPYPUTPiRpRxrhtz0nQ'
      * match actualUpdated_at == '2020-01-05 13:42:21.455187'
      * match actualUrl == 'https://api.chucknorris.io/jokes/Vk2HPYPUTPiRpRxrhtz0nQ'
      * match actualValue == 'Home is where the heart gets ripped out by Chuck Norris.'








