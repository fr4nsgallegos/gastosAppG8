import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase;

  static final DBAdmin _instance = DBAdmin._();
  DBAdmin._();

  factory DBAdmin() {
    return _instance;
  }

  Future<Database?> checkDatabase() async {
    if (myDatabase == null) {
      //AÚN NO SE HA CREADO MYDATABASE
      myDatabase = await initDatabase();
    }
    print("aqui");
    return myDatabase;

    // myDatabase ??= await initDatabase();
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String pathDatabase = join(directory.path, "PagosDB.db");
    return await openDatabase(
      pathDatabase,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute("""CREATE TABLE GASTOS(
                id INTEGER PRIMARY KEY AUTOINCREMENT, 
                title TEXT, 
                price REAL, 
                datetime TEXT, 
                type TEXT
              )""");
      },
    );
  }

  insertarGasto() async {
    Database? db = await checkDatabase();
    int res = await db!.insert(
      "GASTOS",
      {
        "title": "Compra de medias",
        "price": 10.50,
        "datetime": "12/12/2024",
        "type": "Otros",
      },
    );
    print(res);
  }

  obtenerGastos() async {
    Database? db = await checkDatabase();
    List<Map<String, dynamic>> data = await db!.query("GASTOS");
    // List<Map<String, dynamic>> data =
    //     await db!.rawQuery("SELECT TITLE FROM GASTOS WHERE TYPE='Otros'");
    // List<Map<String, dynamic>> data =
    // await db!.query("GASTOS", where: "TYPE='Otros'");
    print(data);
  }
}
