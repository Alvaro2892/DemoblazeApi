Feature: Crear usuario en la website Product Store
  Background:
    * def urlBase = 'https://api.demoblaze.com'
    * def usersPath = '/signup'
    * def usersPathLogin = '/login'
    * def CrearUsuarioJson = read('CrearUsuario.json')
    * def LoginJson = read('Login.json')

#    Se crea un usuario y se imprime el response para verificar si la petición realizó lo que se pretendia realizar
  Scenario: Crear un usuario por medio de la api de  la website Product Store


    Given url  urlBase + usersPath
    And header Accept = "application/json"
    And request CrearUsuarioJson
    When method POST
    Then status 200
    And match response contains ""
    And print response

#    Se desea crear un usuario ya registrado el sistema debe mostrar el mensaje This user already exist.

  Scenario: Crear un usuario con un username ya registrado


    Given url  urlBase + usersPath
    And header Accept = "application/json"
    And request CrearUsuarioJson
    When method POST
    Then status 200
    And match response contains {"errorMessage":"This user already exist."}
    And print response

#  Se desea iniciar sesión con contraseña no válida el response me debe mostrar un mensaje de Wrong password
  Scenario: Intentar realizar un login con un crdenciales no validas


    Given url  urlBase + usersPathLogin
    And header Accept = "application/json"
    And request LoginJson
    When method POST
    Then status 200
    And match response contains {"errorMessage":"Wrong password."}
    And print response

