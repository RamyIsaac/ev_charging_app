import 'dart:convert';

import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/services/shared_preferences_singleton.dart';
import 'package:ev_charging/features/auth/data/models/user_model.dart';
import 'package:ev_charging/features/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  var jsonString = SharedPreferencesSingleton.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
