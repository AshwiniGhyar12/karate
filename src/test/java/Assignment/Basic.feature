Feature: Booking

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * configure header = { Content-Type: 'application/json' }
    * configure header = { Accept : 'application/json' }
    * header cookie = {token: 'abc123'}
    * def req = '{
  "firstname": "Jim",
  "lastname": "Brown",
  "totalprice": 111,
  "depositpaid": true,
  "bookingdates": {
  "checkin": "2018-01-01",
  "checkout": "2019-01-01"
  },
  "additionalneeds": "Breakfast"
  }'

  Scenario: create authentication token
    Given path '/auth'
    And request   { "username" : "jim","password" : "password123"  }
    When method Post
    Then status 200
    And match response.token == '#String'

  Scenario: create booking
    Given path '/booking'
    And request req
    When method Post
    Then status 200
    And match response.bookingid == '#number'

  Scenario: Get booking
    Given path '/booking/id'
    When method Get
    Then status 200
    And match response == {"firstname" : "Jim",  "lastname" : "Brown",  "totalprice" : 111,  "depositpaid" : true,  "bookingdates" : {  "checkin" : "2018-01-01",  "checkout" : "2019-01-01"  },  "additionalneeds" : "Breakfast" }

  Scenario: Update booking
    Given path '/booking/id'
    When method Put
    And request {  "firstname" : "James",  "lastname" : "Brown",  "totalprice" : 111,  "depositpaid" : true,  "bookingdates" : {  "checkin" : "2018-01-01",  "checkout" : "2019-01-01"  },  "additionalneeds" : "Breakfast"  }
    Then status 200
    And match response contains {"firstname" : "James"}

  Scenario: update booking with partial payoad
    Given path '/booking/id'
    When method patch
    And request {  "firstname" : "Jack",  "lastname" : "Brown"}
    Then status 200
    And match response contains {"firstname" : "Jack"}

  Scenario: Delete booking
    Given path '/booking/id'
    When method delete
    Then status 200


