import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:e_com/app/data/models/product/option.dart';

part 'option_category.freezed.dart';
part 'option_category.g.dart';

@freezed
class OptionCategory with _$OptionCategory {
  factory OptionCategory({
    required String title,
    required List<Option> options,
  }) = _OptionCategory;

  factory OptionCategory.fromJson(Map<String, dynamic> json) =>
      _$OptionCategoryFromJson(json);
}
