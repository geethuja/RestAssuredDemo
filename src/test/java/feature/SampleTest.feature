Feature:test basics of karate

  Scenario: test print anf variables
    * print 'GeethujaTom'
    * def  testdata = 30
    * def  addValue = 30
    * print 'result:' + (testdata + addValue)

  Scenario: test json reader parser
    * def jsonObject =
    """
    [
    {
      "name" : "Tom",
      "city" : "Bangalore",
      "age"  : 32
    },
    {
      "name" : "Savio",
      "city" : "Berlin",
      "age"  : 20
    }
    ]
    """
   * print jsonObject
    * print jsonObject[0].name
    * print jsonObject[1].name + " " + jsonObject[1].city + " " +jsonObject[1].age