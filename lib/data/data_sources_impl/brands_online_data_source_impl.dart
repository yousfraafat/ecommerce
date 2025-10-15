import 'package:ecommerce/data/data_sources/brands_online_data_source.dart';
import 'package:ecommerce/data/model/brand_dto.dart';
import 'package:ecommerce/domain/model/brand.dart';
import 'package:ecommerce/domain/result.dart';
import 'package:injectable/injectable.dart';

import '../api_manager.dart';

@Injectable(as: BrandsOnlineDataSource)
class BrandsOnlineDataSourceImpl implements BrandsOnlineDataSource {
  ApiManager apiManager;

  BrandsOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Brand>?>> getBrands() async {
    var result = await apiManager.getBrands();
    switch (result) {
      case Success<List<BrandDto>?>():
        {
          var brandsList =
              result.data?.map((brandDto) => brandDto.toBrand()).toList();
          return Success(brandsList);
        }
      case ServerError<List<BrandDto>?>():
        {
          return ServerError(result.exception);
        }
      case Error<List<BrandDto>?>():
        {
          return Error(result.exception);
        }
      case NoData<List<BrandDto>?>():
        {
          return NoData();
        }
    }
  }
}
