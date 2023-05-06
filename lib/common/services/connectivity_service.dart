import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

enum ConnectionStatus { good, bad, none }

class ConnectionService {
  ConnectionService._internal() {
    initialize();
  }

  static final instance = ConnectionService._internal();
  final Connectivity _connectivity = Connectivity();

  // To capture the network changes in an Application...
  final _connectionChangeController =
      BehaviorSubject<ConnectionStatus>.seeded(ConnectionStatus.good);

  Stream<ConnectionStatus> get connectionChange =>
      _connectionChangeController.stream;

  // When initialized will subscribe to network change stream of Connectivty pkg
  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
  }

  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  Future<void> checkConnection() async {
    var connectionStatus = ConnectionStatus.good;
    try {
      final dio = Dio();
      final response = await dio.get<String>('https://www.google.com');
      if (response.statusCode == 200) {
        connectionStatus = ConnectionStatus.good;
      } else {
        connectionStatus = ConnectionStatus.none;
      }
    } on DioError catch (_) {
      connectionStatus = ConnectionStatus.none;
    } on SocketException catch (_) {
      connectionStatus = ConnectionStatus.none;
    } on TimeoutException catch (_) {
      connectionStatus = ConnectionStatus.bad;
    }
    updateConnectionStatusSubject(connectionStatus);
  }

  void updateConnectionStatusSubject(ConnectionStatus value) {
    if (_connectionChangeController.value == value) {
      return;
    }
    _connectionChangeController.add(value);
  }

  void dispose() {
    _connectionChangeController.close();
  }
}

final ConnectionService connectionServiceSingleton = ConnectionService.instance;
