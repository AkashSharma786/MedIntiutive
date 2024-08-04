import 'dart:io' as io;
import 'dart:math';
import 'package:path/path.dart' as p;
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static Database? _database;
  static final tableName = ["medicine", "profile", "supplier", "orders", "employees", "stock", "order_medicines"];

  static final ordersFields = [
    "id",
    "order_date",
    "status",
    "supplier_id",
    "delivered_date",
    "expiry_date",
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
    "aadhar",
    "experience",
    "is_admin"
   

  ];
  static final orderMedicines = [
    "order_id",
    "medicine_id",
    "quantity",
    "date_of_order"
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
    // final io.Directory appDocumentsDir =
    //     await getApplicationDocumentsDirectory();
    String dbPath = p.join("/databases/", "myDb.db");

    var db = await databaseFactory.openDatabase(dbPath);


   

    //   await db.execute(
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

    //       await db.execute(
    //     '''CREATE TABLE ${tableName[1]} (
    //     ${profileFields[0]} INTEGER PRIMARY KEY,
    //     ${profileFields[1]} TEXT NOT NULL,
    //     ${profileFields[2]} INTEGER NOT NULL,
    //     ${profileFields[3]} TEXT NOT NULL,
    //     ${profileFields[4]} TEXT ,
    //     ${profileFields[5]} TEXT NOT NULL,
    //     ${profileFields[6]} TEXT NOT NULL)''');

    //         await db.execute('''
    //     CREATE TABLE ${tableName[2]} (
    //     ${supplierFields[0]} INTEGER PRIMARY KEY,
    //     ${supplierFields[1]} TEXT NOT NULL,
    //     ${supplierFields[2]} INTEGER,
    //     ${supplierFields[3]} TEXT,
    //     ${supplierFields[4]} TEXT)''');



        //   await db.execute('''

        // CREATE TABLE ${tableName[3]} (
        // ${ordersFields[0]} INTEGER PRIMARY KEY AUTOINCREMENT,
        // ${ordersFields[1]} INTEGER,
        // ${ordersFields[2]} INTEGER,
        // ${ordersFields[3]} INTEGER,
        // ${ordersFields[4]} INTEGER,
        // ${ordersFields[5]} INTEGER,
        // ${ordersFields[6]} TEXT,
        // FOREIGN KEY (${ordersFields[3]}) REFERENCES ${tableName[2]}(${supplierFields[0]}))
        // ''');

    //       await db.execute(
    //       ''' CREATE TABLE ${tableName[4]}(
    //     ${employeesField[0]} INTEGER PRIMARY KEY,
    //     ${employeesField[1]} TEXT NOT NULL,
    //     ${employeesField[2]} TEXT NOT NULL,
    //     ${employeesField[3]} INTEGER,
    //     ${employeesField[4]} TEXT,
    //     ${employeesField[5]} TEXT,
    //     ${employeesField[6]} INTEGER NOT NULL,
    //     ${employeesField[7]} TEXT NOT NULL,
    //     ${employeesField[8]} TEXT,
    //     ${employeesField[9]} TEXT,
    //     ${employeesField[10]} TEXT,
    //     ${employeesField[11]} TEXT NOT NULL)''');



    // await db.execute( '''

    // CREATE TABLE ${tableName[6]} (
    // ${orderMedicines[0]} INTEGER NOT NULL,
    // ${orderMedicines[1]} INTEGER NOT NULL,
    // ${orderMedicines[2]} INTEGER NOT NULL,
    // ${orderMedicines[3]} INTEGER NOT NULL,
    // PRIMARY KEY (${orderMedicines[0]}, ${orderMedicines[1]}),
    // FOREIGN KEY (order_id) REFERENCES ${tableName[3]}(${ordersFields[0]}),
    // FOREIGN KEY (medicine_id) REFERENCES ${tableName[0]}(${medicineFields[0]}))''');

   



    

      

      


  
     
    return db;
  }



static Future<int> getLastIndex(String tableName, String primaryKeyColumn) async {
  final db = await database;

  List<Map<String, Object?>> result = await db.rawQuery(
    'SELECT MAX($primaryKeyColumn) as lastIndex FROM $tableName'
  );

  if (result.isNotEmpty && result[0]['lastIndex'] != null) {
    return result[0]['lastIndex'] as int;
  } else {
    return 0; // Return 0 if the table is empty
  }
}








  static void addItems(
    String tableName,
    Map<String, Object?> data,
  ) async {
    final db = await database;
    print("item added");

    await db.insert(tableName,data,);
    print("item not shown");

    
  }
  
  static void updateItems(String tableName, Map<String, Object?> data, int primayKey) async {
    final db = await database;
    print(data);
    print("item updated");

   await db.update(tableName, data, where: "id = ?", whereArgs: [primayKey]);
  }

  static Future<List<Map<String,Object?>>> searchByKey(String table, String keyField , int key) async
  {
     final db = await database;
      return db.rawQuery("SELECT * FROM $table WHERE $keyField = $key");

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
   

    await db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}
