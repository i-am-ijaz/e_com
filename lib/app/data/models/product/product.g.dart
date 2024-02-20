// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      docId: json['docId'] as String,
      name: json['name'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      optionCategories: (json['optionCategories'] as List<dynamic>)
          .map((e) => OptionCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'name': instance.name,
      'images': instance.images,
      'description': instance.description,
      'price': instance.price,
      'category': instance.category,
      'optionCategories':
          instance.optionCategories.map((e) => e.toJson()).toList(),
    };
