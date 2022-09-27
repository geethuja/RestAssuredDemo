Feature:Create user using post API

  Background:
    * url 'https://gorest.co.in'
    * def requestPayload =
    """
    {
        "name": "tom",
        "email" : "tom98989678@gmail.com",
        "gender" : "male",
        "status" : "active"
    }
    """
  Scenario:Create a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + '80be1a05d72890b1e62fd70bc54246230f683cdad8836bcf85b7a6a83e1a15ea'
    When method post
    Then status 201
    And match $.data.id =='#present'
    And match $.data.name =='#present'
    And match $.data.name =='tom'
    And match $.data.email =='#present'
    And match $.data.email =='tom98989678@gmail.com'