Feature: Booking

  Scenario: create authentication token
    Given url 'https://restful-booker.herokuapp.com/auth'
    And request   { "username" : "ashwini","password" : "password123"  }
    When method Post
    Then status 200

  Scenario: create booking
    Given url 'https://restful-booker.herokuapp.com/booking'
    And request   {  "firstname" : "Jim",  "lastname" : "Brown",  "totalprice" : 111,"depositpaid" : true,"bookingdates" : {"checkin" : "2018-01-01","checkout" : "2019-01-01"},"additionalneeds" : "Breakfast"}
    When method Post
    Then status 200

  Scenario: Get booking
    Given url 'https://restful-booker.herokuapp.com/booking/id'
    When method Get
    Then status 200

  Scenario: Update booking
    Given url 'https://restful-booker.herokuapp.com/booking/id'
    When method Put
    And request {  "firstname" : "James",  "lastname" : "Brown",  "totalprice" : 111,  "depositpaid" : true,  "bookingdates" : {  "checkin" : "2018-01-01",  "checkout" : "2019-01-01"  },  "additionalneeds" : "Breakfast"  }
    Then status 200

  Scenario: update booking with partial payoad
    Given url 'https://restful-booker.herokuapp.com/booking/id'
    When method patch
    And request {  "firstname" : "Jack",  "lastname" : "Brown"}
    Then status 200

  Scenario: Delete booking
    Given url 'https://restful-booker.herokuapp.com/booking/id'
    When method delete
    Then status 200


