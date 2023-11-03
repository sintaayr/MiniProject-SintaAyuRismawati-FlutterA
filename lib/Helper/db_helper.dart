import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/data_apoinment.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  String tablename = 'tabelAppointment';

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'appoinment_db.db'),
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $tablename(
            id TEXT,
            namaRS TEXT,
            alamatRS TEXT,
            telpRS TEXT,
            namaPasien TEXT,
            alamatPasien TEXT,
            umurPasien TEXT,
            tanggalAppointment TEXT,
            keluhanPasien TEXT
            )''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> addAppointment(DataAppointment dataAppointment) async {
    final Database db = await database;
    await db.insert(
      tablename,
      dataAppointment.toMap(),
    );
  }

  Future<List<DataAppointment>> getAppointmentData() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(tablename);
    return results.map((e) => DataAppointment.fromMap(e)).toList();
  }

  // Future<void> updateAppointment(DataAppointment dataAppointment) async {
  //   final db = await database;
  //   await db.update(
  //     tablename,
  //     dataAppointment.toMap(),
  //     where: 'id = ?',
  //     whereArgs: [dataAppointment.id],
  //   );
  // }

  Future<void> deleteAppointmentById(String id) async {
    final db = await database;
    await db.delete(
      tablename,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
