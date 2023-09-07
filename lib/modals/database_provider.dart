import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqlflite_for_windows_with_provider/constants/icons.dart';

class DatabaseProvider {
  //database class from the sqflite
  Database? _database;

  Future<Database> get database async {
    //database directory
    final dbDirectory = await getDatabasesPath();

    //database name
    const dbName = 'expense_tc.db';

    //full path
    final path = join(dbDirectory, dbName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return _database!;
  }

  //table name
  static const cTable = 'categoryTable';
  static const eTable = 'expensesTable';

  //_createDb function
  Future<void> _createDb(
    Database db,
    int version,
  ) async {
    //this creates the tables
    //initialization data can be also inserted in it

    await db.transaction(
      (txn) async {
        //category table
        await txn.execute('''CREATE TABLE $cTable(
        title TEXT,
        enteries INTEGER,
        totalAmt INTEGER,
      )''');

        //expenses table
        await db.transaction(
          (txn) async {
            await txn.execute('''CREATE TABLE $eTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        amount INTEGER,
        date TEXT,
        category TEXT,
      )''');
          },
        );

        //initial category can be inserted here
        icons.forEach(
          (key, value) async {
            await txn.insert(cTable, {
              'title': key,
              'enteries': 0,
              'totalAmt': 0,
            });
          },
        );
      },
    );
  }
}
