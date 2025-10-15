import 'package:ecommerce/domain/model/subcategory.dart';
import 'package:ecommerce/domain/repository/categories_repository.dart';
import 'package:ecommerce/domain/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubcategoriesUseCase {
  CategoriesRepository repository;

  SubcategoriesUseCase(this.repository);

  Future<Result<List<Subcategory>?>> invoke(String categoryId) {
    return repository.getSubcategories(categoryId);
  }
}
