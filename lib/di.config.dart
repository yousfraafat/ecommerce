// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/api_manager.dart' as _i249;
import 'data/data_sources/brands_online_data_source.dart' as _i325;
import 'data/data_sources/categories_online_data_source.dart' as _i506;
import 'data/data_sources_impl/brands_online_data_source_impl.dart' as _i499;
import 'data/data_sources_impl/categories_online_data_source_impl.dart'
    as _i922;
import 'data/repository_impl/brands_repository_impl.dart' as _i138;
import 'data/repository_impl/categories_repository_impl.dart' as _i479;
import 'domain/repository/brands_repository.dart' as _i638;
import 'domain/repository/categories_repository.dart' as _i638;
import 'presentation/features/main_layout/view_model/Brands_view_model.dart'
    as _i742;
import 'presentation/features/main_layout/view_model/categories_view_model.dart'
    as _i280;
import 'presentation/features/main_layout/view_model/subcategories_view_model.dart'
    as _i1038;
import 'presentation/use_case/brands_use_case.dart' as _i563;
import 'presentation/use_case/categories_use_case.dart' as _i1058;
import 'presentation/use_case/subcategories_use_case.dart' as _i675;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i249.ApiManager>(() => _i249.ApiManager());
    gh.factory<_i325.BrandsOnlineDataSource>(
      () => _i499.BrandsOnlineDataSourceImpl(gh<_i249.ApiManager>()),
    );
    gh.factory<_i506.CategoriesOnlineDataSource>(
      () => _i922.CategoriesOnlineDataSourceImpl(gh<_i249.ApiManager>()),
    );
    gh.factory<_i638.BrandsRepository>(
      () => _i138.BrandsRepositoryImpl(gh<_i325.BrandsOnlineDataSource>()),
    );
    gh.factory<_i638.CategoriesRepository>(
      () => _i479.CategoriesRepositoryImpl(
        gh<_i506.CategoriesOnlineDataSource>(),
      ),
    );
    gh.factory<_i563.BrandsUseCase>(
      () => _i563.BrandsUseCase(gh<_i638.BrandsRepository>()),
    );
    gh.factory<_i1058.CategoriesUseCase>(
      () => _i1058.CategoriesUseCase(gh<_i638.CategoriesRepository>()),
    );
    gh.factory<_i675.SubcategoriesUseCase>(
      () => _i675.SubcategoriesUseCase(gh<_i638.CategoriesRepository>()),
    );
    gh.factory<_i742.BrandsViewModel>(
      () => _i742.BrandsViewModel(gh<_i563.BrandsUseCase>()),
    );
    gh.factory<_i1038.SubcategoriesViewModel>(
      () => _i1038.SubcategoriesViewModel(gh<_i675.SubcategoriesUseCase>()),
    );
    gh.factory<_i280.CategoriesViewModel>(
      () => _i280.CategoriesViewModel(gh<_i1058.CategoriesUseCase>()),
    );
    return this;
  }
}
