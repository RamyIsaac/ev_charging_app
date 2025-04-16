import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ev_charging/core/errors/exceptions.dart';
import 'package:ev_charging/core/errors/failures.dart';
import 'package:ev_charging/core/utils/firebase_auth_service.dart';
import 'package:ev_charging/features/auth/data/models/user_model.dart';
import 'package:ev_charging/features/auth/domain/entities/user_entity.dart';
import 'package:ev_charging/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);

      return Right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return const Left(
        ServerFailure(' there was an error, please try again later.'),
      );
    }
  }
}
