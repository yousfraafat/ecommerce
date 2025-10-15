import 'package:ecommerce/di.dart';
import 'package:ecommerce/domain/model/brand.dart';
import 'package:ecommerce/presentation/core/widgets/error_state_widget.dart';
import 'package:ecommerce/presentation/core/widgets/loading_state_widget.dart';
import 'package:ecommerce/presentation/core/widgets/no_data_state_widget.dart';
import 'package:ecommerce/presentation/features/main_layout/home/wigets/brands_section_item.dart';
import 'package:ecommerce/presentation/features/main_layout/home/wigets/category_section_item.dart';
import 'package:ecommerce/presentation/features/main_layout/home/wigets/custom_offers_widget.dart';
import 'package:ecommerce/presentation/features/main_layout/home/wigets/home_section_widget.dart';
import 'package:ecommerce/presentation/features/main_layout/home/wigets/product_section_body.dart';
import 'package:ecommerce/presentation/features/main_layout/view_model/Brands_view_model.dart';
import 'package:ecommerce/presentation/features/main_layout/view_model/categories_view_model.dart';
import 'package:ecommerce/presentation/features/products_screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/category.dart';
import '../../../../domain/ui_state.dart';

class HomeTab extends StatefulWidget {
  VoidCallback? onAllCategoriesTap;

  HomeTab({this.onAllCategoriesTap, super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Offer> offers = [
    Offer(text: 'offer1', image: 'assets/images/offer_1.png'),
    Offer(text: 'offer2', image: 'assets/images/offer_2.png'),
    Offer(text: 'offer3', image: 'assets/images/offer_3.png'),
  ];

  int currentIndex = 0;
  var categoriesViewModel = getIt.get<CategoriesViewModel>();
  var brandsViewModel = getIt.get<BrandsViewModel>();

  @override
  void initState() {
    super.initState();
    categoriesViewModel.loadCategories();
    brandsViewModel.loadBrands();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesViewModel>(
          create: (context) => categoriesViewModel,
        ),
        BlocProvider<BrandsViewModel>(create: (context) => brandsViewModel),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomOffersWidget(
              offers: offers,
              currentIndex: currentIndex,
              onOfferChange: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            SizedBox(height: 10),
            BlocBuilder<CategoriesViewModel, UiState<List<Category>?>>(
              builder: (BuildContext context, UiState<List<Category>?> state) {
                switch (state) {
                  case SuccessState<List<Category>?>():
                    {
                      return HomeSectionWidget(
                        onTap: widget.onAllCategoriesTap,
                        sectionName: 'Categories',
                        body: Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    ProductsScreen.routeName,
                                    arguments: state.data?[index].name,
                                  );
                                },
                                child: CategorySectionItem(state.data?[index]),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  case LoadingState<List<Category>?>():
                    {
                      return LoadingStateWidget(loadingMessage: 'please wait');
                    }
                  case ErrorState<List<Category>?>():
                    {
                      return ErrorStateWidget();
                    }
                  case NoDataState<List<Category>?>():
                    {
                      return NoDataStateWidget();
                    }
                }
              },
            ),
            BlocBuilder<BrandsViewModel, UiState<List<Brand>?>>(
              builder: (BuildContext context, UiState<List<Brand>?> state) {
                switch (state) {
                  case SuccessState<List<Brand>?>():
                    {
                      return HomeSectionWidget(
                        onTap: widget.onAllCategoriesTap,
                        sectionName: 'Brands',
                        body: Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    ProductsScreen.routeName,
                                    arguments: state.data?[index].name,
                                  );
                                },
                                child: BrandsSectionItem(state.data?[index]),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  case LoadingState<List<Brand>?>():
                    {
                      return LoadingStateWidget(loadingMessage: 'please wait');
                    }
                  case ErrorState<List<Brand>?>():
                    {
                      return ErrorStateWidget();
                    }
                  case NoDataState<List<Brand>?>():
                    {
                      return NoDataStateWidget();
                    }
                }
              },
            ),
            HomeSectionWidget(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProductsScreen.routeName,
                  arguments: 'best selling',
                );
              },
              sectionName: 'best selling',
              body: ProductSectionBody(),
            ),
          ],
        ),
      ),
    );
  }
}
