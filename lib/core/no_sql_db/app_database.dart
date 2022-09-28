import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDataBase {
  static Future<Database> initialize() async {
    return await _initSembast();
  }

  static Future<Database> _initSembast() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final databasePath = join(appDir.path, "crypto.db");
    return await databaseFactoryIo.openDatabase(databasePath);
  }
}
