// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'models/product.dart';
// import 'models/invoice.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;

//   static Database? _database;

//   DatabaseHelper._internal();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'gst_billing.db');
//     return openDatabase(path, version: 1, onCreate: _onCreate);
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE products (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT,
//         price REAL,
//         gst REAL
//       )
//     ''');

//     await db.execute('''
//       CREATE TABLE invoices (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         productId INTEGER,
//         total REAL,
//         date TEXT,
//         FOREIGN KEY(productId) REFERENCES products(id)
//       )
//     ''');
//   }

//   // Insert Product
//   Future<int> insertProduct(Product product) async {
//     final db = await database;
//     return await db.insert('products', product.toMap());
//   }

//   // Get All Products
//   Future<List<Product>> getProducts() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('products');
//     return List.generate(maps.length, (i) {
//       return Product.fromMap(maps[i]);
//     });
//   }

//   // Insert Invoice
//   Future<int> insertInvoice(Invoice invoice) async {
//     final db = await database;
//     return await db.insert('invoices', invoice.toMap());
//   }

//   // Get All Invoices
//   Future<List<Invoice>> getInvoices() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('invoices');
//     return List.generate(maps.length, (i) {
//       return Invoice.fromMap(maps[i]);
//     });
//   }

//   // Get Invoice by Product ID
//   Future<List<Invoice>> getInvoicesByProductId(int productId) async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query(
//       'invoices',
//       where: 'productId = ?',
//       whereArgs: [productId],
//     );
//     return List.generate(maps.length, (i) {
//       return Invoice.fromMap(maps[i]);
//     });
//   }
// }
