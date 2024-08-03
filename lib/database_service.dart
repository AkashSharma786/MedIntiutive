import 'dart:io' as io;
import 'package:path/path.dart' as p;
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static Database? _database;
  static final tableName = ["medicine", "profile", "supplier", "buyer"];
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
    "comany"
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

  static void addMedicine(
    int id,
    String name,
    String scientificName,
    double mrp,
    String type,
    String brand,
    double? sellingPrice,
    String? description,
    String? image,
    String? usageDetails,
    String? rackDetails


  ) async {
    final db = await database;
    print("item insertd");
    sellingPrice ??= 0.0;
    description ??= 'No description available';
    image ??= 'default_image.png';
    usageDetails ??= 'No usage details available';
    rackDetails ??= 'No rack details available';
    await db.insert(
      tableName[0],
      {
        medicineFields[0]:id,
        medicineFields[1]:name,
        medicineFields[2]:scientificName,
        medicineFields[3]:mrp,
        medicineFields[4]:type,
        medicineFields[5]:brand,
        medicineFields[6]:sellingPrice,
        medicineFields[7]:description,
        medicineFields[8]:image,
        medicineFields[9]:usageDetails,
        medicineFields[10]:rackDetails




      }


    );
  }

  static Future<List<Map<String, Object?>>> searchItem(
      String tableName,
      String primaryField,
      int primayKey,
      String secondaryField,
      String secondaryKey,
      String tertiaryField,
      String tertiaryKey) async {
    final db = await database;

    
      return db.rawQuery(
          '''SELECT * FROM ${tableName} WHERE $primaryField = $primayKey OR $secondaryField = $secondaryKey OR $tertiaryField = $tertiaryKey''');
    
 
  }

  static void updateMedicine(int id, String newTask) async {
    final db = await database;
    print("item updated");

   // await db.update();
  }





static Future<List<Map<String, Object?>>> showItems(String tableName) async {
    final db = await database;
    print("Item shown");

    return db.rawQuery("SELECT * FROM $tableName");
  }

  static void deleteItem(int id) async {
    final db = await database;
    print("Item deleted");

    //await db.delete( );
  }
}
