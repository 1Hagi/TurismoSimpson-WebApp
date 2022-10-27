# TurismoSimpson-WebApp

-- Descripción :

Aplicación completa con temática de *Los Simpsons* de venta de excursiones y promociones.
Login de usuarios y generación automática de itinerario de compras realizadas.

-- Tecnologías utilizadas :
   
   *BACK-END : Java, Servlets, Servicios, Filtros, Capas (Persistence, Model, Controller, Users) JDBC, patrón DAO, Algoritmos de Ordenamiento.
   *FRONT-END : Html, Css, Javascript, Bootstrap, JQuery, JSP, JSTL. 
   *BBDD: SQlite, tablas Ai, Pk, NN, FK, U.
   *Otros: Patróndiseño MVC+S, Maven Proyect, Apache Tomcat, Eclipse-IDE.

-- Características:

  * Usuarios: 
      - tienen un dinero y tiempo disponible.
      - categoria de excursión favorita.
      - un itinerario asociado de compras realizadas.
  * Excursiones:
      - tienen un costo y tiempo para comprarla.
      - una categoria específica.
      - cupos de disponibilidad.
  * Promociones:
      - son packs de excursiones.
      - pueden contener de 2 a más excursiones.
      - tiempo y costo.
      - una categoria específica.
      - cupos de disponibilidad.
      - un tipo de descuento en el precio.
  * Itinerario:
      - es una lista de compras realizadas.
      - está vinculado a cada usuario.
      
      
-- Funcionamiento:

  * Para levantar el servidor se uso Apache-Tomcat v10.0.22
  * EclipseIDE
  * archivo env.properties cambiar:
      " datasource=jdbc:sqlite:**** Aquí usar la Ruta donde descargó el proyecto ****/db/TSimpsonDB.db: "
