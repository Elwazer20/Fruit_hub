import 'dart:convert';

import '../../Features/auth/data/models/user_model.dart';
import '../../Features/auth/domain/entity/user_entity.dart';
import '../../constants/constants.dart';
import '../services/shared_preferances.dart';


UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}