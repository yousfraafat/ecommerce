import 'package:ecommerce/domain/model/category.dart';
import 'package:ecommerce/domain/result.dart';
import 'package:ecommerce/domain/ui_state.dart';
import 'package:ecommerce/presentation/use_case/categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesViewModel extends Cubit<UiState<List<Category>?>> {
  CategoriesUseCase categoriesUseCase;

  CategoriesViewModel(this.categoriesUseCase) : super(LoadingState());

  Future<void> loadCategories() async {
    var result = await categoriesUseCase.invoke();
    switch (result) {
      case Success<List<Category>?>():
        {
          emit(SuccessState(result.data));
        }
      case ServerError<List<Category>?>():
        {
          emit(ErrorState(result.exception));
        }
      case Error<List<Category>?>():
        {
          emit(ErrorState(result.exception));
        }
      case NoData<List<Category>?>():
        {
          emit(NoDataState());
        }
    }
  }
}
