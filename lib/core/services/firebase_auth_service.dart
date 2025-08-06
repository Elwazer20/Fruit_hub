import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future<void> deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } catch (e) {
      log('Exception in FirebaseAuthService.deleteUser: $e');
      throw CustomExceptions(message: 'An unexpected error occurred: $e');
  }
  }
  Future<User> createUserWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.code} and code is ${e.code}');
      switch (e.code) {
        case 'weak-password':
          throw CustomExceptions(
              message:
                  'The password provided is too weak. Please use a stronger password.');
        case 'email-already-in-use':
          throw CustomExceptions(
              message: 'An account already exists for this email.');
        case 'invalid-email':
          throw CustomExceptions(message: 'The email address is not valid.');
        case 'operation-not-allowed':
          throw CustomExceptions(
              message:
                  'Email/password accounts are not enabled. Contact support.');
        case 'too-many-requests':
          throw CustomExceptions(
              message: 'Too many attempts. Please try again later.');
        default:
          throw CustomExceptions(
              message:
                  'Failed to create user: ${e.message ?? 'Unknown error'}');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword: $e');
      throw CustomExceptions(message: 'An unexpected error occurred: $e');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: $e');
      switch (e.code) {
        case 'user-not-found':
          throw CustomExceptions(message: 'No user found for that email.');
        case 'wrong-password':
          throw CustomExceptions(
              message: 'Wrong password provided for that user.');
        case 'invalid-credential':
          throw CustomExceptions(
              message:
              'Invalid credentials. Please check your email and password.');
        case 'too-many-requests':
          throw CustomExceptions(
              message: 'Too many attempts. Please try again later.');
        default:
          throw CustomExceptions(
              message: 'Failed to sign in: ${e.message ?? 'Unknown error'}');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword: $e');
      throw CustomExceptions(message: 'An unexpected error occurred: $e');
    }
  }
  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
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


  bool isLoggedIn() => FirebaseAuth.instance.currentUser != null;

}

