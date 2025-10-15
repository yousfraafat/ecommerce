import 'package:ecommerce/data/api_manager.dart';
import 'package:ecommerce/data/data_sources/categories_online_data_source.dart';
import 'package:ecommerce/data/model/category_dto.dart';
import 'package:ecommerce/data/model/subcategory_dto.dart';
import 'package:ecommerce/domain/model/category.dart';
import 'package:ecommerce/domain/model/subcategory.dart';
import 'package:ecommerce/domain/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImpl implements CategoriesOnlineDataSource {
  ApiManager apiManager;

  CategoriesOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Category>?>> getCategories() async {
    var result = await apiManager.getCategories();
    switch (result) {
      case Success<List<CategoryDto>?>():
        {
          var categoriesList =
              result.data
                  ?.map((categoryDto) => categoryDto.toCategory())
                  .toList();
          return Success(categoriesList);
        }
      case ServerError<List<CategoryDto>?>():
        {
          return ServerError(result.exception);
        }
      case Error<List<CategoryDto>?>():
        {
          return Error(result.exception);
        }
      case NoData<List<CategoryDto>?>():
        {
          return NoData();
        }
    }
  }

  @override
  Future<Result<List<Subcategory>?>> getSubcategories(String categoryId) async {
    var result = await apiManager.getSubcategories(categoryId);
    switch (result) {
      case Success<List<SubcategoryDto>?>():
        {
          var subcategoriesList =
              result.data
                  ?.map((subcategoryDto) => subcategoryDto.toSubcategory())
                  .toList();
          return Success(subcategoriesList);
        }
      case ServerError<List<SubcategoryDto>?>():
        {
          return ServerError(result.exception);
        }
      case Error<List<SubcategoryDto>?>():
        {
          return Error(result.exception);
        }
      case NoData<List<SubcategoryDto>?>():
        {
          return NoData();
        }
    }
  }
}
