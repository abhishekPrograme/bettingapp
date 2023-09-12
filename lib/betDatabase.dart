import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'betScreen.dart';

class DatabaseHelper {
  static const String _dbName = 'bets_database.db';
  static const String _tableName = 'bets';
  static const String _columnId = 'id';
  static const String _columnTitle = 'title';
  static const String _columnDescription = 'description';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        $_columnId INTEGER PRIMARY KEY,
        $_columnTitle TEXT NOT NULL,
        $_columnDescription TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertBet(Bet bet) async {
    Database db = await instance.database;
    return await db.insert(_tableName, bet.toMap());
  }

  Future<List<Bet>> getAllBets() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (index) {
      return Bet(
        title: maps[index][_columnTitle],
        description: maps[index][_columnDescription],
      );
    });
  }

  Future<void> close() async {
    Database db = await instance.database;
    db.close();
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Bet {
  final String title;
  final String description;

  Bet({required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  static Bet fromMap(Map<String, dynamic> map) {
    return Bet(
      title: map['title'],
      description: map['description'],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// class _BetListScreenState extends State<BetListScreen> {
//   List<Bet> _betList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadBets();
//   }
//
//   Future<void> _loadBets() async {
//     List<Bet> bets = await DatabaseHelper.instance.getAllBets();
//     setState(() {
//       _betList = bets;
//     });
//   }
//
// // ... Rest of the code remains the same
// }
