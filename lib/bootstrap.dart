import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';

import 'package:workroom_flutter_app/core/di/injection.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  AppLogger.logEnable = true;
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  configureDependencies();
  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
