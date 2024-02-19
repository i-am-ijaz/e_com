import 'package:e_com/core/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:e_com/global/app_exception.dart';
import 'package:e_com/global/firebase_error_code_handler.dart';

abstract class BaseAuthService {
  BaseAuthService._();

  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> createUserWithEmailAndPassword(String email, String password);
  Future<void> resetPassword(String email);
  Future<bool> changePassword(String oldPassword, String newPassword);
  Future<bool> deleteAccount(String password);
  Future<void> signOut();
}

class AuthService implements BaseAuthService {
  factory AuthService() => _instance;
  AuthService._();

  static final _instance = AuthService._();

  final _auth = FirebaseAuth.instance;

  Stream<User?> get user => _auth.userChanges();
  User? get currentUser => _auth.currentUser;

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      e.code.log();
      throw AppException(
        title: 'Sign In Failed',
        message: FirebaseErrorCodeHandler.getMessage(
          FirebaseErrorCodeHandler.mapErrorCode(e.code),
        ),
      );
    } catch (e) {
      throw AppException(
        title: 'Sign In Failed',
        message: e.toString(),
      );
    }
  }

  @override
  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      throw AppException(
        title: 'Sign Up Failed',
        message: FirebaseErrorCodeHandler.getMessage(
          FirebaseErrorCodeHandler.mapErrorCode(e.code),
        ),
      );
    } catch (e) {
      throw AppException(
        title: 'Sign In Failed',
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AppException(
        title: 'Sign Out Failed',
        message: FirebaseErrorCodeHandler.getMessage(
          FirebaseErrorCodeHandler.mapErrorCode(e.code),
        ),
      );
    } catch (e) {
      throw AppException(
        title: 'Sign out Failed',
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> changePassword(String oldPassword, String newPassword) async {
    try {
      final userCred = await _reauthenticateUser(oldPassword);
      if (userCred == null) return false;
      if (userCred.user == null) return false;

      await userCred.user!.updatePassword(newPassword);
      return true;
    } on FirebaseAuthException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Something went wrong',
      );
    } catch (e) {
      throw AppException(
        title: 'Password Change Failed',
        message: e.toString(),
      );
    }
  }

  Future<UserCredential?> _reauthenticateUser(String password) async {
    final credential = EmailAuthProvider.credential(
      email: currentUser?.email ?? '',
      password: password,
    );
    return await currentUser?.reauthenticateWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Sign Out Failed',
      );
    } catch (e) {
      throw AppException(
        title: 'Sign Out Failed',
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> deleteAccount(String password) async {
    try {
      final userCred = await _reauthenticateUser(password);
      if (userCred == null) return false;
      if (currentUser == null) return false;

      await currentUser?.delete();
      return true;
    } on FirebaseAuthException catch (e) {
      throw AppException(
        message: e.message ?? '',
        title: 'Account Deletion Failed',
      );
    } catch (e) {
      throw AppException(
        title: 'Account Deletion Failed',
        message: e.toString(),
      );
    }
  }
}
