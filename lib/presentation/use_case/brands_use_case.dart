import 'package:ecommerce/domain/model/brand.dart';
import 'package:ecommerce/domain/repository/brands_repository.dart';
import 'package:ecommerce/domain/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsUseCase {
  BrandsRepository repository;

  BrandsUseCase(this.repository);

  Future<Result<List<Brand>?>> invoke() {
    return repository.getBrands();
  }
}
