import 'package:dio/dio.dart';
import 'package:ecommerce/data/model/brand_dto.dart';
import 'package:ecommerce/data/model/category_dto.dart';
import 'package:ecommerce/data/model/response/Brands_response.dart';
import 'package:ecommerce/data/model/response/Categories_response.dart';
import 'package:ecommerce/data/model/response/Subcategories_response.dart';
import 'package:ecommerce/data/model/subcategory_dto.dart';
import 'package:ecommerce/domain/result.dart';
import 'package:ecommerce/extensions.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  static final dio = Dio();
  static const String baseUrl = 'https://ecommerce.routemisr.com';
  static const String categoriesEndpoint = '$baseUrl/api/v1/categories';
  static const String brandsEndpoint = '$baseUrl/api/v1/brands';

  Future<Result<List<CategoryDto>?>> getCategories() async {
    try {
      var response = await dio.get(categoriesEndpoint);
      var categoriesResponse = CategoriesResponse.fromJson(response.data);
      if (response.statusCode?.isSuccessCall() == true) {
        if (categoriesResponse.results == 0) {
          return NoData();
        }
        return Success(categoriesResponse.data);
      }
      return ServerError(
        ServerErrorException(
          response.statusCode as String,
          response.statusMessage ?? '',
        ),
      );
    } on Exception catch (e) {
      return Error(e);
    }
  }

  Future<Result<List<BrandDto>?>> getBrands() async {
    try {
      var response = await dio.get(brandsEndpoint);
      var brandsResponse = BrandsResponse.fromJson(response.data);
      if (response.statusCode?.isSuccessCall() == true) {
        if (brandsResponse.results == 0) {
          return NoData();
        }
        return Success(brandsResponse.data);
      }
      return ServerError(
        ServerErrorException(
          response.statusCode as String,
          response.statusMessage ?? '',
        ),
      );
    } on Exception catch (e) {
      return Error(e);
    }
  }

  Future<Result<List<SubcategoryDto>?>> getSubcategories(
    String categoryId,
  ) async {
    try {
      var response = await dio.get(
        "$categoriesEndpoint/$categoryId/subcategories",
      );
      var subcategoriesResponse = SubcategoriesResponse.fromJson(response.data);
      if (response.statusCode?.isSuccessCall() == true) {
        if (subcategoriesResponse.results == 0) {
          return NoData();
        }
        return Success(subcategoriesResponse.data);
      }
      return ServerError(
        ServerErrorException(
          response.statusCode as String,
          response.statusMessage,
        ),
      );
    } on Exception catch (e) {
      return Error(e);
    }
  }
}
