import 'package:ecommerce/domain/model/category.dart';
import 'package:ecommerce/domain/repository/categories_repository.dart';
import 'package:ecommerce/domain/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesUseCase {
  CategoriesRepository repository;

  CategoriesUseCase(this.repository);

  Future<Result<List<Category>?>> invoke() {
    return repository.getCategories();
  }
}
