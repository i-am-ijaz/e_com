import 'package:e_com/app/data/collection_refs.dart';
import 'package:e_com/app/data/models/app_user/app_user.dart';
import 'package:e_com/global/app_exception.dart';

class UserRepository {
  static final _productsRef = CollectionRefs().users;

  Future<AppUser> getUserByUid(String uid) async {
    try {
      return _productsRef.doc(uid).get().then((value) {
        return AppUser.fromJson(value.data()!);
      });
    } catch (e) {
      throw const AppException(
        message: 'Error getting user',
        title: 'Error',
      );
    }
  }
}
