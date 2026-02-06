Feature: Crud usuario

  Background:
    * url baseUrl
    * configure headers = headers

  Scenario: CRUD PARA USUARIO
  # 1. creacion de datos
    * def generateUser = read('classpath:utils/generado-data.js')
    * def newUser = generateUser('auto')
    Given path 'usuarios'
    And request newUser
    When method post
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    * def createdId = response._id
    * print createId

  # 2. consulta datos
    Given path 'usuarios', createdId
    When method get
    Then status 200
    And match response == { nome: '#string', email: '#string', password: '#string', administrador: '#string', _id: '#string' }

  # 3. actualizacion datos
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
    Given path 'usuarios', createdId
    And request updateUser
    When method put
    Then status 200
    And match response.message == 'Registro alterado com sucesso'

  # 4. borrado de datso
    Given path 'usuarios', createdId
    When method delete
    Then status 200
    And match response.message == 'Registro excluído com sucesso'
