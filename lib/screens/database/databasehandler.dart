import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  static const databaseName = "MyDatabase.db";
  static const databaseVersion = 1;

  static const table = 'user_table';

  static const columnId = 'id';
  static const columnName = 'name';
  static const columnPhone = 'phone';
  static const columnEmail = 'email';
  static const columnPassword = 'password';

  static const likeTable = 'like_table';
  static const postId = 'postId';
  static const userId = 'userId';
  static const likeId = 'likeId';

  static const saveTable = 'save_table';
  static const saveId = 'saveId';
  static const saveUserId = 'saveUserId';
  static const saveDataId = 'saveDataId';
  Database? db;

  Future<Database> createDb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, databaseName);
    db = await openDatabase(
      path,
      version: databaseVersion,
      onCreate: createTables,
    );

    return db!;
  }

  Future createTables(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT,
            $columnPhone INTEGER,
            $columnEmail TEXT,
            $columnPassword TEXT
          )
          ''');
    await db.execute('''
          CREATE TABLE $likeTable (
            $postId INTEGER PRIMARY KEY,
            $likeId INTEGER,
            $userId INTEGER
          )
          ''');
    await db.execute('''
          CREATE TABLE $saveTable (
            $saveId INTEGER PRIMARY KEY,
            $saveUserId INTEGER,
            $saveDataId INTEGER
          )
          ''');
  }

  Future<int> insertUsers(Map<String, dynamic> row) async {
    print("row ======= $row");
    var sdb = await createDb();
    return sdb.insert(table, row);
  }

  Future<int> insertLikeUser(Map<String, dynamic> row) async {
    print("row ======= $row");
    var sdb = await createDb();
    return sdb.insert(likeTable, row);
  }

  Future<int> insertSaveUser(Map<String, dynamic> row) async {
    print("row ======= $row");
    var sdb = await createDb();
    return sdb.insert(saveTable, row);
  }

  Future<List<Map<String, dynamic>>> getUsersWithLikes(int loginId) async {
    print("login id ====== $loginId");
    Database db = await createDb();

    String query = '''
    SELECT $table.$columnId, $table.$columnName, $table.$columnEmail, $table.$columnPhone, $table.$columnPassword, $likeTable.$postId, $likeTable.$userId, $likeTable.$likeId
    FROM $table
    INNER JOIN $likeTable ON $table.$columnId = $likeTable.$userId WHERE $likeTable.$likeId = $loginId
  ''';
    return await db.rawQuery(query);
  }

  Future<List<Map<String, dynamic>>> likeUser(int userGetId, int likeGetId) async {
    Database db = await createDb();
    List<Map<String, dynamic>> result =
        await db.query(likeTable, where: '$userId = ? AND $likeId = ?', whereArgs: [userGetId, likeGetId]);
    print("result data ========== $result");
    return result;
  }

  Future<List<Map<String, dynamic>>> saveUser(int userGetId, int saveGetId) async {
    Database db = await createDb();
    List<Map<String, dynamic>> result =
    await db.query(saveTable, where: '$saveUserId = ? AND $saveDataId = ?', whereArgs: [userGetId, saveGetId]);
    print("result data ========== $result");
    return result;
  }

  Future<List<Map<String, dynamic>>> getUsersWithSaves(int loginId) async {
    Database db = await createDb();

    String query = """
    SELECT $table.$columnId, $table.$columnName, $table.$columnEmail, $table.$columnPhone, $table.$columnPassword, $saveTable.$saveId, $saveTable.$saveUserId, $saveTable.$saveDataId
    FROM $table
    INNER JOIN $saveTable ON $table.$columnId = $saveTable.$saveUserId WHERE $saveTable.$saveDataId = $loginId
  """;
    return await db.rawQuery(query);
  }

  Future<List<dynamic>> queryAllRows() async {
    var sdb = await createDb();
    return await sdb.query(table);
  }

  Future<Map<String, dynamic>?> loginUsers(String email, String password) async {
    Database db = await createDb();
    List<Map<String, dynamic>> results = await db.query(
      table,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return results.firstOrNull;
  }

  Future<List<Map<String, dynamic>>> queryNotAllRows(String id) async {
    Database db = await createDb();
    List<Map<String, dynamic>> results = await db.query(
      table,
      where: 'id != ?',
      whereArgs: [id],
    );
    print("result $results");
    return results;
  }
}
