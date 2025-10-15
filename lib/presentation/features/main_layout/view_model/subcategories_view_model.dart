import 'package:ecommerce/domain/model/subcategory.dart';
import 'package:ecommerce/domain/result.dart';
import 'package:ecommerce/domain/ui_state.dart';
import 'package:ecommerce/presentation/use_case/subcategories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubcategoriesViewModel extends Cubit<UiState<List<Subcategory>?>> {
  SubcategoriesUseCase subcategoriesUseCase;

  SubcategoriesViewModel(this.subcategoriesUseCase) : super(LoadingState());

  Future<void> loadSubcategories(String? categoryId) async {
    var result = await subcategoriesUseCase.invoke(categoryId ?? "");
    switch (result) {
      case Success<List<Subcategory>?>():
        {
          emit(SuccessState(result.data));
        }
      case ServerError<List<Subcategory>?>():
        {
          emit(ErrorState(result.exception));
        }
      case Error<List<Subcategory>?>():
        {
          emit(ErrorState(result.exception));
        }
      case NoData<List<Subcategory>?>():
        {
          emit(NoDataState());
        }
    }
  }
}
