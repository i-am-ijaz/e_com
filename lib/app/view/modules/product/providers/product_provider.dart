import 'dart:io';

import 'package:e_com/app/data/models/product/product.dart';
import 'package:e_com/app/data/repositories/product_repository.dart';
import 'package:e_com/app/data/repositories/storage_repository.dart';
import 'package:e_com/global/exception_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
class ProductProvider extends _$ProductProvider {
  @override
  Future<void> build() async {}

  Future<void> add(Product product, List<XFile> images) async {
    try {
      await ProductRepository.create(product);

      if (images.isEmpty) return;

      final productImages = <String>[];
      for (final image in images) {
        final uploadedImage = await StorageRepository.uploadFile(
          File(image.path),
        );
        productImages.add(uploadedImage);
      }

      product = product.copyWith(images: productImages);
      await ProductRepository.update(product);
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
  }

  Stream<CategorizedProducts> getAll() {
    return ProductRepository.getAllStream();
  }

  Future<void> remove(Product product) async {
    try {
      await ProductRepository.delete(product);
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
  }
}
