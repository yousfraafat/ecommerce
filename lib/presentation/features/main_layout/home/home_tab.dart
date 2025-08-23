import 'package:ecommerce/presentation/features/main_layout/home/wigets/custom_offers_widget.dart';
import 'package:ecommerce/presentation/features/main_layout/home/wigets/home_section_body.dart';
import 'package:ecommerce/presentation/features/main_layout/home/wigets/home_section_widget.dart';
import 'package:ecommerce/presentation/features/main_layout/home/wigets/product_section_body.dart';
import 'package:ecommerce/presentation/features/products_screen/products_screen.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          HomeSectionWidget(
            onTap: widget.onAllCategoriesTap,
            sectionName: 'Categories',
            body: HomeSectionBody(
              imageUrl: '',
              itemName: 'category',
              itemsCount: 10,
            ),
          ),
          HomeSectionWidget(
            sectionName: 'Brands',
            body: HomeSectionBody(
              imageUrl: '',
              itemName: 'brand',
              itemsCount: 10,
            ),
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
    );
  }
}
