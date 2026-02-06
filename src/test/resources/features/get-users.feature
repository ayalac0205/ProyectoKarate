Feature: GET /usuarios

  Background:
    * url baseUrl
    * configure headers = headers

  Scenario: Lista de usuarios - resultado ok
    Given path 'usuarios'
    When method get
    Then status 200
    And match response contains { usuarios: '#[]' }
    And match response == read('classpath:schemas/user-list-schema.json')
    And match each response.usuarios ==
    """
    {
      "nome": "#string",
      "email": "#string",
      "password": "#string",
      "administrador": "#string",
      "_id": "#string"
    }
    """

  Scenario: Lista de usuario - resultado error
    Given path 'usuarios'
    And request {}
    When method post
    Then status 400
