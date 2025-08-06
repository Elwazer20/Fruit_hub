import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hup/Features/auth/data/models/user_model.dart';
import 'package:fruit_hup/Features/auth/domain/entity/user_entity.dart';
import 'package:fruit_hup/constants/constants.dart';
import 'package:fruit_hup/core/errors/failure.dart';
import 'package:fruit_hup/core/services/shared_preferances.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/utils/back_end_endpoints.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService dateBaseService;

  AuthRepoImpl(
      {required this.dateBaseService, required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          emailAddress: email, password: password);
      var userEntity = UserEntity(uId: user.uid, email: email, name: name);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);

      return Left(ServerFailure(e.message));
    } catch (e, stackTrace) {
      await deleteUser(user);
      log('Exception in createUserWithEmailAndPassword come from AuthRepoImpl: $stackTrace');
      log('Exception in createUserWithEmailAndPassword come from AuthRepoImpl: $e');
      return Left(
        ServerFailure('Failed to create user.'),
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
      String email, String password) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
          emailAddress: email, password: password);
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);
      return Right(userEntity);
    } on CustomExceptions catch (e, stackTrace) {
      log('Exception in signInWithEmailAndPassword come from AuthRepoImpl: $stackTrace');
      log('Exception in signInWithEmailAndPassword come from AuthRepoImpl: $e');
      return Left(ServerFailure(e.message));
    } catch (e, stackTrace) {
      log('Exception in signInWithEmailAndPassword come from AuthRepoImpl: $stackTrace');
      log('Exception in signInWithEmailAndPassword come from AuthRepoImpl: $e');
      return Left(
        ServerFailure('Failed to sign in.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      final user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isExist = await dateBaseService.checkIfDataExists(
          path: BackEndEndpoints.isUserExist, docuementId: user.uid);
      if (isExist) {
        await getUserData(uId: user.uid);
      }
      await addUserData(user: userEntity);
      await saveUserData(user: userEntity);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      log('Exception in signInWithGoogle come from AuthRepoImpl: $e');
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in signInWithGoogle come from AuthRepoImpl: $e');
      return Left(
        ServerFailure('Failed to sign in.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      final result = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(result);
      await addUserData(user: userEntity);
      await saveUserData(user: userEntity);
      return Right(UserModel.fromFirebaseUser(result));
    } on CustomExceptions catch (e) {
      log('Exception in signInWithFacebook come from AuthRepoImpl: $e');
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);

      log('Exception in signInWithFacebook come from AuthRepoImpl: $e');
      return Left(
        ServerFailure('Failed to sign in.'),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await dateBaseService.addData(
        path: BackEndEndpoints.addUserData,
        data: UserModel.fromEntity(user).toMap(),
        documentId: user.uId);
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var data = await dateBaseService.getData(
        path: BackEndEndpoints.getUserData, docuementId: uId);
    return UserModel.fromJson(data);
  }

  @override
  Future<void> saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
