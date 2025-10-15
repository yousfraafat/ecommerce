import 'package:ecommerce/data/data_sources/categories_online_data_source.dart';
import 'package:ecommerce/domain/model/category.dart';
import 'package:ecommerce/domain/model/subcategory.dart';
import 'package:ecommerce/domain/result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/categories_repository.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesOnlineDataSource categoriesOnlineDataSource;

  CategoriesRepositoryImpl(this.categoriesOnlineDataSource);

  @override
  Future<Result<List<Category>?>> getCategories() {
    return categoriesOnlineDataSource.getCategories();
  }

  @override
  Future<Result<List<Subcategory>?>> getSubcategories(String categoryId) {
    return categoriesOnlineDataSource.getSubcategories(categoryId);
  }
}
