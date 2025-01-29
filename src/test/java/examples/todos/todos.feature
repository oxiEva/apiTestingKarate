@all
Feature: Karate Basic Todos

  Background:
    * url apiUrl

  @getAll
  Scenario: Get all todos
    When method Get
    Then status 200

    # Check all response objects
    And match each response contains {complete: '#boolean'}

  Scenario: Get todo flow
    * def taskName = 'First task'

    # Create a single todo
    Given request {title: '#(taskName)', complete: false}
    When method Post
    Then status 200
    And match response == {id: '#string', title: '#(taskName)', complete: false}
    * def id = response.id
    * def title = response.title
    * def status = response.complete
    * print "Value of id: " + id

    # Get a single todo
    Given path id
    When method Get
    Then status 200
    And match response == {id: '#(id)', title: '#(taskName)', complete: false}

    # Create a second todo
    * def todo =
    """
        {
          "title": "Study karate and restAssured",
          "complete": false
        }
    """
    Given request todo
    And header Content-Type = "application/json"
    When method Post
    Then status 200
    And match response == {id: '#string', title: 'Study karate and restAssured', complete: false}

    # Get all todos
    When method Get
    Then status 200
    * def firstTask = response[0]
    * match firstTask.title == taskName
    * match firstTask.complete == false

    * call read('classpath:helpers/resetTodos.feature')