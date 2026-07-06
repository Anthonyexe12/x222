# Historia relacionada: US04 - Iniciar Sesión de Estudio (EP02: Sesiones de Estudio)
Feature: Iniciar sesión de estudio
 
  Como estudiante
  Deseo iniciar una sesión de estudio indicando el tema o curso
  Para que FocusMind comience a monitorear mi comportamiento
 
  Scenario: Inicio de sesión exitoso
	Given que el usuario está autenticado en el panel principal de FocusMind
	When ingresa "Cálculo Diferencial" en el campo de tema
	And selecciona "Estudiar y comprender el tema" como objetivo
	And presiona el botón "Iniciar sesión"
	Then el sistema inicia el monitoreo de comportamiento
	And muestra el cronómetro activo en pantalla
	And el estado de la sesión cambia a "Activa"
 
  Scenario: Inicio de sesión sin tema ingresado
	Given que el usuario está en la pantalla de inicio de sesión de estudio
	When deja el campo de tema vacío
	And presiona "Iniciar sesión"
	Then el sistema no inicia la sesión
	And muestra el mensaje "Ingresa el tema de estudio para continuar"
	And el foco se coloca en el campo de tema
 
  Scenario Outline: Inicio con distintos temas de curso
	Given que el usuario está autenticado
	When ingresa "<tema>" en el campo de tema y presiona "Iniciar sesión"
	Then el sistema inicia el monitoreo con el tema "<tema>"
 
	Examples:
  	| tema                	|
  	| Álgebra Lineal      	|
  	| Programación Orientada  |
  	| Matemática Discreta 	|
