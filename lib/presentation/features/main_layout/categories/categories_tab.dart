import 'package:ecommerce/di.dart';
import 'package:ecommerce/domain/ui_state.dart';
import 'package:ecommerce/presentation/core/widgets/error_state_widget.dart';
import 'package:ecommerce/presentation/core/widgets/loading_state_widget.dart';
import 'package:ecommerce/presentation/features/main_layout/categories/widgets/categories_tab_content.dart';
import 'package:ecommerce/presentation/features/main_layout/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/category.dart';
import '../../../core/widgets/no_data_state_widget.dart';

class CategoriesTab extends StatefulWidget {
  CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  var categoriesViewModel = getIt.get<CategoriesViewModel>();
  late Category selectedCategory;

  @override
  void initState() {
    super.initState();
    categoriesViewModel.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesViewModel>(
      create: (context) => categoriesViewModel,
      child: BlocBuilder<CategoriesViewModel, UiState<List<Category>?>>(
        builder: (BuildContext context, UiState<List<Category>?> state) {
          switch (state) {
            case SuccessState<List<Category>?>():
              {
                return CategoriesTabContent(state.data);
              }
            case LoadingState<List<Category>?>():
              {
                return LoadingStateWidget();
              }
            case ErrorState<List<Category>?>():
              {
                return ErrorStateWidget(exception: state.exception);
              }
            case NoDataState<List<Category>?>():
              {
                return NoDataStateWidget();
              }
          }
        },
      ),
    );
  }
}
