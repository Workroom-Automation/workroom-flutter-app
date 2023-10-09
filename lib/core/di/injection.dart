import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:supertokens_flutter/supertokens.dart';
import 'package:workroom_flutter_app/core/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt.init();
  SuperTokens.init(
    // TODO: Take these values from env variable
    apiDomain: 'https://dev.api.onworkroom.com:9006',
    apiBasePath: '/auth',
  );
}
