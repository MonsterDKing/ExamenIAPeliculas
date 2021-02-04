import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  String filePath;

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    //no existe es nula es necesaria crearla
    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'HallazgoDB.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Consolidada('
          'id INTEGER PRIMARY KEY,'
          'EMPRESA TEXT,'
          'PROCESO TEXT,'
          'SUBPROCESO TEXT,'
          'UBICACION TEXT,'
          'INCIDENTE TEXT,'
          'PELIGRO TEXT,'
          'RIESGO TEXT,'
          'ACTIV_CONT TEXT,'
          'TIPO_ACTIVIDAD TEXT,'
          'idUbicacion INTEGER ,'
          'idEmpresa INTEGER'
          ')');

      await db.execute('CREATE TABLE ConsolidadaDos('
          'id INTEGER PRIMARY KEY,'
          'idgen_empresas INTEGER,'
          'nombre_empresas TEXT,'
          'idgen_procesos INTEGER,'
          'nombre_procesos TEXT,'
          'idgen_subprocesos INTEGER,'
          'nombre_subprocesos TEXT,'
          'idgen_ubicacion INTEGER,'
          'nombre_ubicacion TEXT,'
          'idgen_peligroreal INTEGER,'
          'nombre_peligroreal TEXT ,'
          'gen_magnitudes_idgen_magnitudes TEXT ,'
          'detalles_subproceso TEXT '
          ')');

      await db.execute('CREATE TABLE ControlTable('
          'id INTEGER PRIMARY KEY,'
          'idgen_empresas INTEGER,'
          'gen_subprocesos_gen_procesos_idgen_procesos INTEGER,'
          'gen_subprocesos_idgen_subprocesos INTEGER,'
          'nombre_procesos TEXT '
          ')');

      await db.execute('CREATE TABLE Incidentes('
          'id INTEGER PRIMARY KEY,'
          'gen_subprocesos_idgen_subprocesos INTEGER,'
          'gen_subprocesos_gen_procesos_idgen_procesos INTEGER,'
          'riesgo TEXT,'
          'nombre_procesos TEXT '
          ')');

      await db.execute('CREATE TABLE MapaDeRiesgoTable('
          'id INTEGER PRIMARY KEY,'
          'gen_empresas_idgen_empresas INTEGER,'
          'gen_ubicacion_idgen_ubicacion INTEGER,'
          'gen_subprocesos_idgen_subprocesos INTEGER,'
          'Nombre TEXT '
          ')');
    });
  }

  //CREAR REGISTRO EN DB

}
