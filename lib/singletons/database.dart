import 'package:casa_fruit_scale_codes/objects/scale_code.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


const String CodesTableName = "Codes";

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();

  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._internal();

  static Database? _db;

  Map<int,ScaleCode>? _scaleCodes;

  void loadDatabase() async {
    if (_db != null) return;
    _db = await _initDatabase();
    await scaleCodes();
  }

  Map<int,ScaleCode>? getActualMap()
  {
    return _scaleCodes;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $CodesTableName (id INTEGER PRIMARY KEY, name TEXT NOT NULL, description TEXT)',
        );
      },
    );
  }

  Future<void> insertScaleCode(ScaleCode sc) async {

    if(_scaleCodes != null)
    {
      _scaleCodes![sc.id] = sc;
    }

    await _db!.insert(
      CodesTableName,
      sc.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );


  }

  Future<List<ScaleCode>> scaleCodes() async {
    final List<Map<String, Object?>> dogMaps = await _db!.query(CodesTableName);


    List<ScaleCode> lst = [
      for (final {
      'id': id as int,
      'name': name as String,
      'description': description as String,
      } in dogMaps)
        ScaleCode(id: id, name: name, description: description),
    ];

    _scaleCodes = <int,ScaleCode>{};

    for (var element in lst) {
      _scaleCodes![element.id] = element;
    }

    return lst;

  }

  Future<bool> checkCode(int id) async {

    if(_scaleCodes != null)
    {
      return _scaleCodes!.containsKey(id);
    }

    final result = await _db!.query(
      CodesTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;

  }

  Future<void> updateScaleCode(ScaleCode sc) async {

    if(_scaleCodes != null)
    {
      if(_scaleCodes!.containsKey(sc.id)) {
        _scaleCodes![sc.id] = sc;
      }
    }

    await _db!.update(
      CodesTableName,
      sc.toMap(),
      where: 'id = ?',
      whereArgs: [sc.id],
    );
  }

  Future<void> deleteScaleCodeById(int id) async {

    if(_scaleCodes != null)
    {
      if(_scaleCodes!.containsKey(id)) {
        _scaleCodes!.remove(id);
      }
    }

    await _db!.delete(
      CodesTableName,where: 'id = ?',
      whereArgs: [id],
    );

  }

  Future<void> deleteScaleCode(ScaleCode sc) async => await deleteScaleCodeById(sc.id);




}