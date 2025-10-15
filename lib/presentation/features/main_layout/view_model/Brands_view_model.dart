import 'package:ecommerce/domain/model/brand.dart';
import 'package:ecommerce/domain/result.dart';
import 'package:ecommerce/domain/ui_state.dart';
import 'package:ecommerce/presentation/use_case/brands_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsViewModel extends Cubit<UiState<List<Brand>?>> {
  BrandsUseCase brandsUseCase;

  BrandsViewModel(this.brandsUseCase) : super(LoadingState());

  Future<void> loadBrands() async {
    var result = await brandsUseCase.invoke();
    switch (result) {
      case Success<List<Brand>?>():
        {
          emit(SuccessState(result.data));
        }
      case ServerError<List<Brand>?>():
        {
          emit(ErrorState(result.exception));
        }
      case Error<List<Brand>?>():
        {
          emit(ErrorState(result.exception));
        }
      case NoData<List<Brand>?>():
        {
          emit(NoDataState());
        }
    }
  }
}
