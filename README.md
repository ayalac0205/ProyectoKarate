CLONAR E IR RAMA DEVELOP
# reto karate framework

## requisitos
- Java 11+
- Maven 3.6+
- Conexión a internet (para acceder a https://serverest.dev)

## estructura
Se tiene estructurado dentro de la carpeta test considerando sus subcarpetas java y resources
En java se tiene el runner correspondiente para poder ser modificado para el escenario a ejecutar
Por otro lado en resources se tiene  3 carpeta y una clase js (este ultimo se explica en el siguiente punto).
Las 3 carpetas aparte son los features, schemas  y utils
Los features estan los escenarios definidos por bdd para la ejecucion de casos establecidos
Los schemas estan los formatos json para la validacion y reutilizacion correspondiente de respuestas esperadas
Y los utils esta definido una clase js para una generacion de data dinamica focalizado a los campos del usuario creado con cierta funciona para el email 

## configuración
- Revisar `src/test/resources/karate-config.js` para cambiar `baseUrl` o headers.
- No se requiere credencial para endpoints públicos de Serverest en este reto.

## ejecutar tests (opcional si no ejecutar el runner explicado en el punto -> estructura)
- Ejecutar todos:
  `mvn test`
- Ejecutar un feature:
  `mvn test -Dkarate.options="classpath:features/users/post-user.feature"`

## buenas prácticas
- Generación dinámica de datos para evitar colisiones.
- Uso de variables y reutilizacion de datos 
- Validación de esquema con placeholders de Karate.

## reportes
- Reportes HTML en `target/karate-reports`.


