// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OptionCategoryImpl _$$OptionCategoryImplFromJson(Map<String, dynamic> json) =>
    _$OptionCategoryImpl(
      title: json['title'] as String,
      categoryOptions: (json['categoryOptions'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OptionCategoryImplToJson(
        _$OptionCategoryImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'categoryOptions': instance.categoryOptions,
    };
