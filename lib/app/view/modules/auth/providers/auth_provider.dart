import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:e_com/core/services/auth_service.dart';
import 'package:e_com/global/exception_handler.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthProvider extends _$AuthProvider {
  @override
  Future<void> build() async {}

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();

    try {
      await AuthService().signInWithEmailAndPassword(email, password);
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
  }

  Future<void> register(String email, String password) async {
    state = const AsyncValue.loading();

    try {
      await AuthService().createUserWithEmailAndPassword(email, password);
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
  }

  Future<void> logout() async {
    try {
      await AuthService().signOut();
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
  }
}
