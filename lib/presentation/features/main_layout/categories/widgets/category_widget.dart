import 'package:ecommerce/domain/model/category.dart';
import 'package:ecommerce/domain/model/subcategory.dart';
import 'package:ecommerce/domain/ui_state.dart';
import 'package:ecommerce/presentation/core/widgets/loading_state_widget.dart';
import 'package:ecommerce/presentation/features/main_layout/categories/widgets/subcategory_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../di.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/no_data_state_widget.dart';
import '../../view_model/subcategories_view_model.dart';

class CategoryWidget extends StatefulWidget {
  Category category;

  CategoryWidget({required this.category, super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  var subcategoryViewModel = getIt.get<SubcategoriesViewModel>();

  @override
  void initState() {
    super.initState();
    subcategoryViewModel.loadSubcategories(widget.category.id);
  }

  @override
  void didUpdateWidget(covariant CategoryWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      subcategoryViewModel.loadSubcategories(widget.category.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubcategoriesViewModel>(
      create: (context) => subcategoryViewModel,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.category.name ?? '',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Expanded(
              child: BlocBuilder<
                SubcategoriesViewModel,
                UiState<List<Subcategory>?>
              >(
                builder: (
                  BuildContext context,
                  UiState<List<Subcategory>?> state,
                ) {
                  switch (state) {
                    case SuccessState<List<Subcategory>?>():
                      {
                        return SubcategoryWidget(
                          state.data,
                          widget.category.image,
                        );
                      }
                    case LoadingState<List<Subcategory>?>():
                      {
                        return LoadingStateWidget();
                      }
                    case ErrorState<List<Subcategory>?>():
                      {
                        return ErrorStateWidget(exception: state.exception);
                      }
                    case NoDataState<List<Subcategory>?>():
                      {
                        return NoDataStateWidget();
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
