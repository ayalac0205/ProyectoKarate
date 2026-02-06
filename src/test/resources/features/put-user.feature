Feature: PUT /usuarios - Actualizar usuario

  Background:
    * url baseUrl
    * configure headers = { 'Content-Type': 'application/json' }

  Scenario: Actualizar usuario existente
  # Primero crear usuario
    * def generateUser = read('classpath:utils/generado-data.js')
    * def newUser = generateUser('auto')
    Given path 'usuarios'
    And request newUser
    When method post
    Then status 201
    * def id = response._id

  # Actualizar usuario
    * def updateUser =
"""
{
  "nome": "NombreActualizado",
  "email": "#(newUser.email)",
  "password": "#(newUser.password)",
  "administrador": "false"
}
"""
    * print updateUser
    Given path 'usuarios', id
    And request updateUser
    When method put
    Then status 200
    And match response.message == 'Registro alterado com sucesso'


  Scenario: Actualizar usuario con id inválido
    * def updateUser = { nome: 'NombreInvalido', email: 'fake@test.com', password: 'Pass1234!', administrador: 'false' }
    Given path 'usuarios', 'id-invalido-123'
    And request updateUser
    When method put
    Then status 400
