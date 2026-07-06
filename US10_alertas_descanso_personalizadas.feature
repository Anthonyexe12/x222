# Historia relacionada: US10 - Alertas de Descanso Personalizadas (EP03: Detección de Fatiga y Alertas)
Feature: Alertas de descanso personalizadas
 
  Como estudiante
  Deseo recibir alertas amigables cuando FocusMind detecta que necesito descansar
  Para tomar pausas oportunas sin depender de mi propia percepción del cansancio
 
  Scenario: Alerta generada por detección de fatiga
	Given que el sistema ha detectado un nivel de fatiga superior al 70% para el usuario activo
	When el algoritmo activa el proceso de alerta
	Then el sistema muestra una notificación con el mensaje "Parece que necesitas un descanso. Te recomendamos pausar 5 minutos"
	And ofrece dos opciones: "Iniciar pausa guiada" y "Continuar de todas formas"
	And la alerta se muestra de forma no intrusiva sin bloquear la pantalla
 
  Scenario: Usuario acepta la pausa recomendada
	Given que el usuario recibe una alerta de descanso
	When presiona "Iniciar pausa guiada"
	Then el sistema inicia una pausa activa guiada de 5 minutos
	And el cronómetro principal se detiene durante la pausa
	And el tipo de pausa (respiración, estiramiento o mindfulness) se selecciona automáticamente
 
  Scenario: Usuario descarta la alerta
	Given que el usuario recibe una alerta de descanso
	When presiona "Continuar de todas formas"
	Then el sistema cierra la alerta sin interrumpir la sesión
	And registra la alerta como descartada para análisis posterior
	And no vuelve a mostrar alerta en los próximos 10 minutos
 
  Scenario Outline: Nivel de alerta según intensidad de fatiga detectada
	Given que el sistema calcula un nivel de fatiga de "<nivel>%" para el usuario activo
	When el algoritmo evalúa el nivel frente al umbral configurado de 70%
	Then el resultado de alerta generado es "<resultado>"
 
	Examples:
  	| nivel | resultado   	|
  	| 40    | Sin alerta  	|
  	| 70    | Alerta generada |
  	| 90    | Alerta urgente  |

