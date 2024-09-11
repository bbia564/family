import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../entity/pay_item.dart';

class DatabaseService extends GetxService {
  late Database db;
  final faker = Faker();

  Future<DatabaseService> init() async {
    await initDB();
    return this;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'expenses_db.db');

    db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await createTable(db);
    });
  }

  createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS family (id INTEGER PRIMARY KEY,category TEXT,time TEXT,amount REAL,notes TEXT,created_at TEXT)');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS personal (id INTEGER PRIMARY KEY,category TEXT,time TEXT,amount REAL,notes TEXT,created_at TEXT)');
    await createDefaultData(db);
  }

  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  createDefaultData(Database db) async {
    List<String> ll = ["Shopping", 'Entertainment', "Other"];
    for (var i = 0; i < 3; i++) {
      var category = faker.randomGenerator.element<String>(ll);
      var amount = faker.randomGenerator.integer(1000, min: 100);
      var cuDate = DateTime.now();
      DateTime randomDate =
          faker.date.dateTimeBetween(cuDate.subtract(const Duration(days: 20)), cuDate);
      await db.insert('family', {
        'category': category,
        'amount': amount,
        'notes': category,
        'time': formatter.format(randomDate),
        'created_at': formatter.format(DateTime.now()),
      });
    }
    for (var i = 0; i < 3; i++) {
      var category = faker.randomGenerator.element<String>(ll);
      var amount = faker.randomGenerator.integer(1000, min: 100);
      var cuDate = DateTime.now();
      DateTime randomDate =
          faker.date.dateTimeBetween(cuDate.subtract(const Duration(days: 20)), cuDate);
      await db.insert('personal', {
        'category': category,
        'amount': amount,
        'notes': category,
        'time': formatter.format(randomDate),
        'created_at': formatter.format(DateTime.now()),
      });
    }
  }

  addFamilyExpenses(
    String category,
    double amount,
    String date,
    String notes,
  ) async {
    await db.insert('family', {
      'category': category,
      'amount': amount,
      'notes': notes,
      'time': date,
      'created_at': formatter.format(DateTime.now()),
    });
  }

  addPersonalExpenses(
    String category,
    double amount,
    String date,
    String notes,
  ) async {
    await db.insert('personal', {
      'category': category,
      'amount': amount,
      'notes': notes,
      'time': date,
      'created_at': formatter.format(DateTime.now()),
    });
  }

  clean() async {
    await db.delete('family');
    await db.delete('personal');
  }

  closer() async {
    await db.close();
  }

  Future<List<PayItem>> getPersonalPay(String category) async {
    var result =
        await db.query('personal', where: "category =?", whereArgs: [category], orderBy: 'id DESC');
    return result.map((e) => PayItem.fromJson(e)).toList();
  }

  Future<List<PayItem>> getFamilyPay(String category) async {
    var result =
        await db.query('family', where: "category =?", whereArgs: [category], orderBy: 'id DESC');
    return result.map((e) => PayItem.fromJson(e)).toList();
  }

  Future<double> getFamilyTotalAmountByType(String type) async {
    final result = await db.rawQuery(
      'SELECT SUM(amount) as total FROM family WHERE category = "$type"',
    );
    return result.first['total'] as double? ?? 0.0;
  }

  Future<int> getFamilyExpenseCountByType(String type) async {
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM family WHERE category = "$type"',
    );
    return result.first['count'] as int? ?? 0;
  }

  Future<double> getFamilyTotalAmount() async {
    final result = await db.rawQuery(
      'SELECT SUM(amount) as total FROM family',
    );
    return result.first['total'] as double? ?? 0.0;
  }

  Future<int> getFamilyExpenseCount() async {
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM family',
    );
    return result.first['count'] as int? ?? 0;
  }

  Future<double> getPersonalTotalAmountByType(String type) async {
    final result = await db.rawQuery(
      'SELECT SUM(amount) as total FROM personal WHERE category = "$type"',
    );
    return result.first['total'] as double? ?? 0.0;
  }

  Future<int> getPersonalExpenseCountByType(String type) async {
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM personal WHERE category = "$type"',
    );
    return result.first['count'] as int? ?? 0;
  }

  Future<double> getPersonalTotalAmount() async {
    final result = await db.rawQuery(
      'SELECT SUM(amount) as total FROM personal',
    );
    return result.first['total'] as double? ?? 0.0;
  }

  Future<int> getPersonalExpenseCount() async {
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM personal',
    );
    return result.first['count'] as int? ?? 0;
  }
}
