import 'dart:io' as io;
import 'package:path/path.dart' as p;
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static Database? _database;
  static final tableName = ["medicine", "profile", "supplier", "orders", "employees", "stock"];

  static final ordersFields = [
    "id",
    "order_date",
    "status",
    "supplier_id",
    "order_items_id",
    "message",
  ];
  static final medicineFields = [
    "id",
    "name",
    "scientific_name",
    "mrp",
    "brand",
    "type",
    "selling_price",
    "description",
    "image",
    "usage_direction",
    "rack_details"
  ];
  static final profileFields = [
    "id",
    "name",
    "phone",
    "email",
    "address",
    "username",
    "password"
  ];
  static final supplierFields = [
    "id",
    "name",
    "phone",
    "email",
    "address",
  ];
  static final stockFields = [
    "serial_no",
    "medicine_id",
    "quantity",
    "arraival_date",
    "expiry_date",

  ];
  static final employeesField = [
    "id",
    "first_name",
    "last_name",
    "phone",
    "email",
    "address",
    "dob",
    "gender",
    "photo",
    "aadhar"
    "experience"
   

  ];

  static Future<Database> get database async {
    if (_database != null) return _database!;

    // Initialize the database
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;
    final io.Directory appDocumentsDir =
        await getApplicationDocumentsDirectory();
    String dbPath = p.join(appDocumentsDir.path, "databases", "myDb.db");

    var db = await databaseFactory.openDatabase(dbPath);

    // await db.execute(
    //    '''CREATE TABLE ${tableName[0]} (
    //     ${medicineFields[0]} INTEGER PRIMARY KEY,
    //     ${medicineFields[1]} TEXT NOT NULL,
    //      ${medicineFields[2]} TEXT NOT NULL,
    //       ${medicineFields[3]} REAL NOT NULL,
    //        ${medicineFields[4]} TEXT NOT NULL,
    //         ${medicineFields[5]} TEXT NOT NULL,
    //          ${medicineFields[6]} REAL, ${medicineFields[7]} TEXT,
    //          ${medicineFields[8]} TEXT, ${medicineFields[9]} TEXT,
    //          ${medicineFields[10]} Text)'''
    //   );
    return db;
  }

  static void addItems(
    String tableName,
    Map<String, Object?> data,
  ) async {
    final db = await database;

    await db.insert(tableName,data,);
  }
  
  static void updateMedicine(String tableName, Map<String, Object?> data, int primayKey) async {
    final db = await database;
    print("item updated");

   await db.update(tableName, data, where: "id = ?", whereArgs: [primayKey]);
  }



  static Future<List<Map<String, Object?>>> searchItem(
      String tableName,
      String primaryField,
      int? primayKey,
      String secondaryField,
      String secondaryKey,
      String tertiaryField,
      String tertiaryKey) async {

        print(primayKey);
        print(secondaryKey);
        print(tertiaryKey);
    final db = await database;

    if (primayKey == null) {
      return db.rawQuery(
          '''SELECT * FROM ${tableName} WHERE $secondaryField LIKE '%$secondaryKey%' AND $tertiaryField LIKE '%$tertiaryKey%' ''');
    } else 
      return db.rawQuery(
          '''SELECT * FROM ${tableName} WHERE ( $primaryField = $primayKey ) AND $secondaryField LIKE '%$secondaryKey%' AND $tertiaryField LIKE '%$tertiaryKey%' ''');
    
 
  
}





static Future<List<Map<String, Object?>>> showItems(String tableName) async {
    final db = await database;
    print("Item shown");

    return db.rawQuery("SELECT * FROM $tableName");
  }

  static void deleteItem(String tableName, int id) async {
    final db = await database;
    print("Item deleted");

    await db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}
