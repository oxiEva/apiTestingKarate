Feature: Second file for todos

  Background:
    * url apiUrl

  Scenario: Update and delete todos

    * def taskName = 'My task'

    # Create a single todo
    Given request {title: '#(taskName)', complete: false}
    When method Post
    Then status 200
    And match response == {id: '#string', title: '#(taskName)', complete: false}
    * def id = response.id

     # Update a  todo
    Given path id
    And request {title:'#(taskName)', complete: true}
    When method Put
    Then status 200
    And match response == {id: '#(id)', title: '#(taskName)', complete: true}

    # Delete a todo
    Given path id
    When method Delete
    Then status 200
