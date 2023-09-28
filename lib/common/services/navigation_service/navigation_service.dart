import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';

@singleton
class NavigationService {
  final GlobalKey<NavigatorState> myNavigatorKey = GlobalKey<NavigatorState>();
  BuildContext? get currentContext => myNavigatorKey.currentContext;
  State? get currentState => myNavigatorKey.currentState;
  Future<dynamic>? pushNamed(String routeName, {dynamic arguments}) {
    return myNavigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? pushReplacementNamed(String routeName, {dynamic arguments}) {
    return myNavigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic>? pushAndRemoveUntil(
    Route<dynamic> route,
    bool Function(Route<dynamic>) predicate,
  ) {
    return myNavigatorKey.currentState?.pushAndRemoveUntil(route, predicate);
  }

  Future<dynamic>? pushNamedAndRemoveUntil(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    dynamic arguments,
  }) {
    return myNavigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  void pop() {
    return myNavigatorKey.currentState?.pop(true);
  }

  void killApp() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  String? getCurrentScreenName() {
    String? currentScreenName;
    myNavigatorKey.currentState?.popUntil((route) {
      currentScreenName = route.settings.name;
      AppLogger.printLog('checkCurrentPath -- $currentScreenName');
      return true;
    });
    return currentScreenName ?? '';
  }
}
