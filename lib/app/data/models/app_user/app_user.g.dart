// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'role': _$RoleEnumMap[instance.role]!,
      'phone': instance.phone,
    };

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.user: 'user',
};
