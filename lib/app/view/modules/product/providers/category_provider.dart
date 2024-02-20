import 'package:e_com/app/data/repositories/category_repository.dart';
import 'package:e_com/global/exception_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
class CategoryProvider extends _$CategoryProvider {
  @override
  Future<List<String>> build() async {
    try {
      return await CategoryRepository.getAll();
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
    return [];
  }

  Future<void> addCategory(String category) async {
    try {
      await CategoryRepository.create(category);
    } catch (e) {
      AppExceptionHandler().handleException(e, StackTrace.current);
    }
  }
}
