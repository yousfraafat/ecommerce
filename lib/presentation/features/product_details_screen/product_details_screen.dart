import 'package:ecommerce/presentation/core/widgets/buttons/cart_button.dart';
import 'package:ecommerce/presentation/core/widgets/price_section.dart';
import 'package:ecommerce/presentation/features/product_details_screen/widgets/color_picker.dart';
import 'package:ecommerce/presentation/features/product_details_screen/widgets/description_text.dart';
import 'package:ecommerce/presentation/features/product_details_screen/widgets/product_images_slider.dart';
import 'package:ecommerce/presentation/features/product_details_screen/widgets/size_picker.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../core/widgets/buttons/custom_button.dart';
import '../../core/widgets/product_counter.dart';
import '../auth/profile_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = 'Product details';

  ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<String> images = [
    'assets/images/product_detail_1.png',
    'assets/images/product_detail_2.png',
    'assets/images/product_detail_3.png',
  ];

  List<int> sizes = [39, 40, 41, 42, 43];
  List<Color> colors = [
    Colors.brown,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.white,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: TextStyle(fontWeight: FontWeight.w500, color: MyApp.mainColor),
        ),
        actions: [
          CartButton(),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              },
              icon: ImageIcon(
                AssetImage('assets/images/profile_icon.png'),
                color: MyApp.mainColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImagesSlider(
                images: images,
                currentIndex: currentIndex,
                onImageChange: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'product name',
                    style: TextStyle(
                      color: MyApp.mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '8000 EGP',
                    style: TextStyle(
                      color: MyApp.mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: MyApp.mainColor.withOpacity(.2),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('1000 sold'),
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/rating_icon.png'),
                        color: Colors.amber,
                      ),
                      Text(
                        '4.8 (7500)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    height: 40,
                    width: 115,
                    buttonBody: ProductCounter(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Description',
                style: TextStyle(
                  color: MyApp.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              DescriptionText(lines: 2, text: 'Description'),
              SizedBox(height: 10),
              Text(
                'size',
                style: TextStyle(
                  color: MyApp.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              SizePicker(selectedSize: sizes[0], sizes: sizes),
              SizedBox(height: 10),
              Text(
                'color',
                style: TextStyle(
                  color: MyApp.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              ColorPicker(selectedColor: colors[0], colors: colors),
              SizedBox(height: 20),
              PriceSection(
                buttonBody: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_shopping_cart, color: Colors.white),
                    SizedBox(width: 30),
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
