import 'dart:developer';

import 'package:ev_charging/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

/*************  ✨ Windsurf Command ⭐  *************/
  /// Creates a new user account with the given email and password.
  ///
  /// This method attempts to create a new user account in Firebase
  /// Authentication using the provided email and password. If the
  /// creation is successful, it returns the created [User] object.
  ///
  /// Throws a [CustomException] with a specific message if the
  /// creation fails due to reasons such as weak password, email
  /// already in use, network failure, or other errors.
  ///
  /// - Parameters:
  ///   - email: The email address of the user to be created.
  ///   - password: The password for the new user account.
  ///
  /// - Returns: A [Future] that resolves to the created [User] object
  ///   if the operation is successful.

/*******  1dcbc0cd-0eb2-4935-a334-1525a276fe9c  *******/ Future<User>
      createUserWithEmailAndPassword(
          {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'Internet Connection Failed.');
      } else {
        throw CustomException(
            message: 'there was an error, please try again later.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}');

      throw CustomException(
          message: 'there was an error, please try again later.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}');
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'Wrong email or password provided for that user.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'Wrong email or password provided for that user.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'Internet Connection Failed.');
      } else {
        throw CustomException(
            message: 'there was an error, please try again later.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}');

      throw CustomException(
          message: 'there was an error, please try again later.');
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }
}
