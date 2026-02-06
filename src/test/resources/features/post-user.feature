Feature: Creacion de usuarios

  Background:
    * url baseUrl
    * configure headers = headers

  Scenario: creacion data - con data ok
    * def generateUser = read('classpath:utils/generado-data.js')
    * def newUser = generateUser('auto')
    Given path 'usuarios'
    And request newUser
    When method post
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'

  Scenario: creacion data - con data inexistente
    Given path 'usuarios'
    And request
   """
    {
      "nome": "Fulano da Silva",
      "password": "teste",
      "administrador": "true"
    }
    """
    When method post
    Then status 400
    And match response.email contains 'email é obrigatório'
    And match response contains { email: '#string' }
    And match response !contains { message: '#present' }

