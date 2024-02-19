import 'package:e_com/global/enum/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    required String uid,
    required String email,
    required String name,
    required Role role,
    required String phone,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
