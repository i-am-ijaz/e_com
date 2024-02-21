// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartProductImpl _$$CartProductImplFromJson(Map<String, dynamic> json) =>
    _$CartProductImpl(
      productId: json['productId'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartProductImplToJson(_$CartProductImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'options': instance.options.map((e) => e.toJson()).toList(),
    };
