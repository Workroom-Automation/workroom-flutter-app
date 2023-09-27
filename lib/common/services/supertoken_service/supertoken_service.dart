import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:supertokens_flutter/supertokens.dart';

class SupertokenService {
  static Future<bool> doesSessionExist() async {
    return SuperTokens.doesSessionExist();
  }

  static Future<String> getUserId() async {
    return SuperTokens.getUserId();
  }

  static Future<void> signout() async {
    return SuperTokens.signOut();
  }

  static Future<bool> manualRefresh() async {
    // Returns true if session was refreshed, false if session is expired
    return SuperTokens.attemptRefreshingSession();
  }

  static Future<bool> doesSessionExistAndRefresh() async {
    final success = await SupertokenService.doesSessionExist();
    if (success) {
      return true;
    }
    return SupertokenService.manualRefresh();
  }

  @disposeMethod
  void dispose() {
    // _connectionChangeController.close();
  }
}
