import 'package:dartz/dartz.dart';
import 'package:ev_charging/core/errors/failures.dart';
import 'package:ev_charging/features/auth/data/models/user_model.dart';
import 'package:ev_charging/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email, required String password, required String name});

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future addUserData({required UserEntity user});
  Future saveUserData({required UserModel user});
  Future<UserEntity> getUserData({required String uId});
}
