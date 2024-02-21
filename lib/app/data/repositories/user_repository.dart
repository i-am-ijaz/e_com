import 'package:e_com/app/data/collection_refs.dart';
import 'package:e_com/app/data/models/app_user/app_user.dart';
import 'package:e_com/global/app_exception.dart';
import 'package:e_com/global/enum/enum.dart';

class UserRepository {
  static final _productsRef = CollectionRefs().users;

  Future<AppUser?> getUserByUid(String uid) async {
    try {
      return _productsRef.doc(uid).get().then((value) {
        if (!value.exists) return null;
        return AppUser.fromJson(value.data()!);
      });
    } catch (e) {
      throw const AppException(
        message: 'Error getting user',
        title: 'Error',
      );
    }
  }

  Future<void> create(String email, String uid) async {
    try {
      await _productsRef.doc(uid).set(
            AppUser(
              uid: uid,
              email: email,
              name: 'Customer+$uid',
              role: Role.user,
              phone: '+1234567890',
            ).toJson(),
          );
    } catch (e) {
      throw const AppException(
        message: 'Error creating user',
        title: 'Error',
      );
    }
  }
}
