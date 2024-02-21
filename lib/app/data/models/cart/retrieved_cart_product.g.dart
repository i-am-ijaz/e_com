// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieved_cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RetrievedCartProductImpl _$$RetrievedCartProductImplFromJson(
        Map<String, dynamic> json) =>
    _$RetrievedCartProductImpl(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RetrievedCartProductImplToJson(
        _$RetrievedCartProductImpl instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
      'options': instance.options.map((e) => e.toJson()).toList(),
    };
