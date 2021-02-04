# Flutter Cinepolis IA

Prueba de flutter para IA

## Dependencias Utilizadas

* http: Se utilizo para realizar peticiones Http  a los endpoints solicitados
  
* sqflite: Se utilizo para crear una base de datos interna de la aplicacion a un que existe la base de datos realmente no se guardo nada dentro de ellas ya que casi todo solicita peticiones http  data_connection_checker: Libreria para ver la conectividad del dispositivo en caso de estar offline usaria la base de datos

* path_provider: Para poder ubicar y guardar el archivo de base de datos

* get_it: Para poder cargar dependencias como localstore y i18n para las traducciones dependiendo de el idioma del dispositvo

* provider: Manejador de estado de la aplicacion 

* flutter_form_builder: Libreria para Para manejar los formularios

* awesome_dialog: Libreria para Crear dialogos como logueo incorrecto etc.

* video_player: Libreria para Cargar el video atravez de la url de la api

* *hewie: Libreria para Controladores por defecto a el video cargado

* shared_preferences: Libreria para guardar en local la sesion del usuario como sus datos y atravez de esta saber si enviarlo a la vista de login o directamente a la aplicacion

* flutter_social_content_share: Libreria para  compartir las peliculas atravez de redes sociales

* flutter_i18n: Libreria para generar traducciones 

## Estructura del proyecto

* Config se maneja un archivo base para configuracion ( para guardar las rutas o url de manera estatica)
* Models para almacenar los modelos y sus respectivos metodos de TOJSON FROMJSON
* Provider como carpeta de repositorio para poder compartir la informacion en toda la aplicacion ( manejador de estado)
* Screens vistas que son independientes totalmente una de otra
* Services carpeta para manejar los archivos y sus peticiones en caso de ser muchos endpoints poder identificar por cada modelo y objeto al ser tan pocos opte por juntar todo
* UI en esta carpeta agregue todo los widgets que se pdrian reutilizar en otras vistas o elementos que depende de una vista como tal

## Como correr el proyecto

* Clonar el repositorio
* Flutter Clean
* Flutter pub get o Flutter packages get

## Posibles problemas 

* Aun que yo no tube problemas para iniciar el proyecto en caso de que android tire el error de DEX 64 bits es necesario ingresar a la carpeta /Android/App/build.gradle y agregar estas configuraciones 

    * en el defaultconfig agregar   :      multiDexEnabled true
    * y en dependencies :    implementation 'com.android.support:multidex:1.0.3'

tuve que agregar esto ya que algunas librerias estan deprecadas ( serian las de shared flutter_social_content_share lo intente con diversas y tuve el mismo problema pero con esto se corrige ) .

## Comentarios 
* No pude conectar con el servicio de la tarjeta  que seria este (  https://stageapi.cinepolis.com/v1/members/loyalty/ ) siempre me retorna un error 404 a un que ya se cuenta con todo el metodo y estructura para realizar esta tarea necesito verificar como consumir de manera correcta el endpoint 
