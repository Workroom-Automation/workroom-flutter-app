// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:workroom_flutter_app/app/app.dart';
import 'package:workroom_flutter_app/bootstrap.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final directory = await getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  await bootstrap(() => const App());
}
