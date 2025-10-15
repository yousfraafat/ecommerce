import 'package:ecommerce/domain/model/category.dart';
import 'package:ecommerce/domain/model/subcategory.dart';
import 'package:ecommerce/domain/result.dart';

abstract class CategoriesOnlineDataSource {
  Future<Result<List<Category>?>> getCategories();

  Future<Result<List<Subcategory>?>> getSubcategories(String categoryId);
}
