Feature: DELETE /usuarios - Eliminar usuario

  Background:
    * url baseUrl
    * configure headers = { 'Content-Type': 'application/json' }

  Scenario: Eliminar usuario existente
  # Primero crear usuario
    * def generateUser = read('classpath:utils/generado-data.js')
    * def newUser = generateUser('auto')
    Given path 'usuarios'
    And request newUser
    When method post
    Then status 201
    * def id = response._id

  # Eliminar usuario
    Given path 'usuarios', id
    When method delete
    Then status 200
    And match response.message == 'Registro excluído com sucesso'

  Scenario: Eliminar usuario con id inválido
    Given path 'usuarios', 'id-invalido-123'
    When method delete
    Then status 200
    And match response.message == 'Nenhum registro excluído'

