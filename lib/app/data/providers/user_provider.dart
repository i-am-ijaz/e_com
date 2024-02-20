import 'package:e_com/app/data/models/app_user/app_user.dart';
import 'package:e_com/app/data/repositories/user_repository.dart';
import 'package:e_com/core/extensions.dart';
import 'package:e_com/core/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
class UserProvider extends _$UserProvider {
  @override
  Future<AppUser?> build() async {
    try {
      if (AuthService().currentUser == null) return null;
      final uid = AuthService().currentUser!.uid;
      return await UserRepository().getUserByUid(uid);
    } catch (e) {
      e.logError();
    }
    return null;
  }
}
