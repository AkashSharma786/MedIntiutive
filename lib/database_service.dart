import 'dart:io' as io;
import 'package:path/path.dart' as p;
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static Database? _database;
  static final tableName = ["medicine", "profile", "supplier", "buyer"];
  static final  medicineNields = ["id", "name", "quantity", "price", "expiry_date", "supplier_id", "buyer_id"];
  static final  profileFields =   ["id", "name", "phone", "email", "address", "username", "password"];
  static final  supplierFields = ["id", "name", "phone", "email", "address", "comany"];


  static Future<Database> get database async {
    if (_database != null) return _database!;

    // Initialize the database
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;
    final io.Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    String dbPath = p.join(appDocumentsDir.path, "databases", "myDb.db");

    var db = await databaseFactory.openDatabase(dbPath);

   // await db.execute();
    return db;
  }

  static void addItem  (int id, String text) async {
    final db = await database;
    print("item insertd");
 //   await db.insert();

  }

  static void updateItem(int id, String newTask) async{

    final db = await database;
    print("item updated");

   // await db.update();

  }

  static void showItems() async{
    final db = await database;
    print("Item shown");

  //  var querydata = await db.rawQuery("SELECT * FROM $table_name");
   


  }

  static void deleteItem(int id) async{
    final db = await database;
    print("Item deleted");

    //await db.delete( );

  }


}