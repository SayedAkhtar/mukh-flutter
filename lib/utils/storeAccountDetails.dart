import 'package:mukh/models/accountFields.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Account {
  final String account = 'account';
  static final Account instance = Account._init();

  static Database? _database;

  Account._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'mukh.db');
    await deleteDatabase(path);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final textType = 'TEXT';
    await db.execute(
        '''CREATE TABLE Account (${AccountFields.id} INTEGER PRIMARY KEY,
        ${AccountFields.firstName} $textType,
        ${AccountFields.lastName} $textType,
        ${AccountFields.email} $textType,
        ${AccountFields.primaryPhone} $textType,
        ${AccountFields.alternatePhone} $textType,
        ${AccountFields.type} $textType,
        ${AccountFields.registrationId} $textType,
        ${AccountFields.gender} $textType,
        ${AccountFields.accountVerifiedAt} $textType,
        ${AccountFields.emailVerifiedAt} $textType,
        ${AccountFields.createdAt} $textType,
        ${AccountFields.updatedAt} $textType,
        ${AccountFields.deletedAt} $textType,
        ${AccountFields.city} $textType,
        ${AccountFields.image} $textType
        );''');
  }

  Future<void> storeAccountDetails(var result) async {
    final db = await instance.database;

    await db.insert(account, AccountFields.toJson(result));
  }

  Future<void> updateAccountDetails(var result) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'mukh.db');
    Database db = await openDatabase(
      path,
      version: 1,
    );

    await db.update(account, AccountFields.toJson(result),
        where: '${AccountFields.id} = ?', whereArgs: [result['id']]);
    await db.close();
  }

  Future<List<Map>> getAccDetails() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'mukh.db');
    Database db = await openDatabase(
      path,
      version: 1,
    );

    List<Map> list = await db.rawQuery('''SELECT * FROM Account''');
    await db.close();
    return list;
  }
}
