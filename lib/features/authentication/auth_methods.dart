import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/services/api_service/dio_api_service.dart';
import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';

class AuthMethods {
  final dio = DioApiService(authBaseUrl);
  // TODO: get it through env variables
  Future<bool> emailPasswordLogin(String email, String password) async {
    try {
      var identifier = Map<String, dynamic>();
      identifier['rid'] = 'emailpassword';
      final resp = await dio.post(
        '/auth/public/signin',
        {
          'formFields': [
            {'id': 'email', 'value': email},
            {'id': 'password', 'value': password}
          ]
        },
        {},
        identifier,
      );
      AppLogger.printLog(resp);
      if (resp.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      AppLogger.printLog(e.toString());
      return false;
    }
  }
}
