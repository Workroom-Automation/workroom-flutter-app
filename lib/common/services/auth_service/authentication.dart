import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/foundation.dart';
import 'package:workroom_flutter_app/common/config.dart';
import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';

class Authentication {
  Authentication() {
    final appConfig =
        AppConfigurations.getConfiguration(Environment.development);
    final webConfig =
        WebConfigurations.getConfiguration(Environment.development);
    auth0 = Auth0(appConfig.domainName, appConfig.clientId);
    auth0Web = Auth0Web(webConfig.domainName, webConfig.clientId);
    if (kIsWeb) {
      auth0Web.onLoad().then((credentials) {
        user = credentials?.user;
        AppLogger.printLog('user=$user');
      });
    }
  }
  UserProfile? user;
  String domainName = 'dev-x4nooh6fddekh6dd.us.auth0.com';
  String clientId = 'vfHzlrLh8JuZiz9nUt84HRcar9gBYnB0';

  late Auth0 auth0;
  late Auth0Web auth0Web;

  Future<void> login() async {
    try {
      if (kIsWeb) {
        return auth0Web
            .loginWithRedirect(redirectUrl: 'http://localhost:3000')
            .then((value) {});
      }
      final credentials = await auth0.webAuthentication().login();
      user = credentials.user;
      AppLogger.printLog('user=$user');
    } catch (e) {
      AppLogger.printLog(e, tag: 'Authentication error');
    }
  }

  Future<void> logout() async {
    try {
      if (kIsWeb) {
        return auth0Web.logout(returnToUrl: 'http://localhost:3000');
      }
      await auth0.webAuthentication().logout();
      user = null;
    } catch (e) {
      AppLogger.printLog(e, tag: 'Authentication error');
    }
  }
}
