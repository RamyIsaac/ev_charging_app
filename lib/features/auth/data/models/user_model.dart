import 'package:ev_charging/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.name, required super.uId});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? '',
      name: user.displayName ?? '',
      uId: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        name: json['name'],
        uId: json['uId'],
      );

  factory UserModel.fromEntity(UserEntity user) => UserModel(
        email: user.email,
        name: user.name,
        uId: user.uId,
      );

  Map<String, dynamic> toMap() => {'email': email, 'name': name, 'uId': uId};
}
