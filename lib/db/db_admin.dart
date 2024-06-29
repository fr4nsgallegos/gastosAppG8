import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase;

  Future<Database?> checkDatabase() async {
    if (myDatabase == null) {
      //AÚN NO SE HA CREADO MYDATABASE
      myDatabase = await initDatabase();
    } else {
      return myDatabase;
    }
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
    db!.insert(
      "GASTOS",
      {
        "title": "Compras en el mercado",
        "price": 1200.50,
        "datetime": "12/12/2024",
        "type": "Alimentos",
      },
    );
  }
}
