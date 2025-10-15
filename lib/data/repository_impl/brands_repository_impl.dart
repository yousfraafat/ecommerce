import 'package:ecommerce/data/data_sources/brands_online_data_source.dart';
import 'package:ecommerce/domain/model/brand.dart';
import 'package:ecommerce/domain/repository/brands_repository.dart';
import 'package:ecommerce/domain/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl implements BrandsRepository {
  BrandsOnlineDataSource brandsOnlineDataSource;

  BrandsRepositoryImpl(this.brandsOnlineDataSource);

  @override
  Future<Result<List<Brand>?>> getBrands() {
    return brandsOnlineDataSource.getBrands();
  }
}
