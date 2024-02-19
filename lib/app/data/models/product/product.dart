import 'package:e_com/app/data/models/product/category.dart';
import 'package:e_com/app/data/models/product/option_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    required String docId,
    required String name,
    required List<String> images,
    required String description,
    required double price,
    required Category category,
    required List<OptionCategory> optionCategories,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
