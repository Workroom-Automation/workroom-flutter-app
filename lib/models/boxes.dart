import 'package:hive/hive.dart';
import 'package:workroom_flutter_app/models/user_model.dart';

class Boxes {
  static Box<UserModel> getusers() => Hive.box<UserModel>('users');
}
