import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:supertokens_flutter/supertokens.dart';

class SupertokenService {
  static Future<bool> doesSessionExist() async {
    return SuperTokens.doesSessionExist();
  }

  Future<String> getUserId() async {
    return SuperTokens.getUserId();
  }

  static Future<void> signout() async {
    return SuperTokens.signOut();
  }

  Future<void> manualRefresh() async {
    // Returns true if session was refreshed, false if session is expired
    var success = await SuperTokens.attemptRefreshingSession();
  }

  @disposeMethod
  void dispose() {
    // _connectionChangeController.close();
  }
}
