
import 'dart:io' as io;
import 'package:mobx_emp_manager/models/employees.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const EMPLOYEE_TABLE = 'db_employee';

  static const String EMPLOYEE_SQL = """CREATE TABLE $EMPLOYEE_TABLE(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT, 
    age INTEGER,
    position TEXT,
    phone TEXT,
    address TEXT,
    isRetired INTEGER,
    createdAt TEXT    
  )""";

  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if(_db !=null) return  _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'app_db');
    var theDb = await openDatabase(
        path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return theDb;
  }

  _onCreate(Database db, int version) async {
    await db.execute(EMPLOYEE_SQL);
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {

  }

  /// INSERT AN EMPLOYEE TO LOCAL
  Future<int> insertEmpLocal (Employees employee) async {
    var dbClient = await db;
    var result = await dbClient.insert(EMPLOYEE_TABLE, employee.toMap());
    return result;
  }

  /// GET ALL EMPLOYEES NON RETIRED
  Future<List<Employees>> getEmployees() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient.query(EMPLOYEE_TABLE, orderBy: 'id DESC');
    return List.generate(result.length, (i) {
      return Employees(
        id: result[i]['id'],
        name: result[i]['name'],
        age: result[i]['age'],
        phone: result[i]['phone'],
        position: result[i]['position'],
        createdAt: result[i]['createdAt'],
        isRetired: result[i]['isRetired'],
        address: result[i]['address'],
      );
    });
  }

  /// DELETE AN EMPLOYEE
  Future<int> deleteEmpById (int id) async {
    var dbClient = await db;
    var result = await dbClient.delete(EMPLOYEE_TABLE,where: 'id = ?', whereArgs: [id]);
    return result;
  }

  /// UPDATE AN EMPLOYEE
  Future<int> updateEmpById (Employees emp) async {
    var dbClient = await db;
    var result = await dbClient.update(EMPLOYEE_TABLE, emp.toMap(), where: "id = ?", whereArgs: [emp.id]);
    return result;
  }


}
