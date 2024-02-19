// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
    };
