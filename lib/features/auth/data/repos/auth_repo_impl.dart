import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/errors/exceptions.dart';
import 'package:ev_charging/core/errors/failures.dart';
import 'package:ev_charging/core/services/database_service.dart';
import 'package:ev_charging/core/services/shared_preferences_singleton.dart';
import 'package:ev_charging/core/utils/backend_end_points.dart';
import 'package:ev_charging/core/utils/firebase_auth_service.dart';
import 'package:ev_charging/features/auth/data/models/user_model.dart';
import 'package:ev_charging/features/auth/domain/entities/user_entity.dart';
import 'package:ev_charging/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);

      var userEntity = UserEntity(email: email, name: name, uId: user.uid);
      await addUserData(user: userEntity);
      return Right(
        userEntity,
      );
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await firebaseAuthService.deleteUser();

      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return const Left(
        ServerFailure(' there was an error, please try again later.'),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);
      return Right(
        userEntity,
      );
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.SignInWithEmailAndPassword: ${e.toString()}');
      return const Left(
        ServerFailure(' there was an error, please try again later.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;

    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.isDataExist(
        path: BackendEndPoints.isUserExist,
        documentId: user.uid,
      );

      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return const Left(
        ServerFailure(' there was an error, please try again later.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return const Left(
        ServerFailure(' there was an error, please try again later.'),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackendEndPoints.addUserData,
        data: UserModel.fromEntity(user).toMap(),
        documentId: user.uId);
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
        path: BackendEndPoints.getUserData, documentId: uId);

    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());

    await SharedPreferencesSingleton.setString(kUserData, jsonData);
  }
}
