import 'package:ecommerce/domain/model/brand.dart';
import 'package:ecommerce/domain/result.dart';

abstract class BrandsRepository {
  Future<Result<List<Brand>?>> getBrands();
}
