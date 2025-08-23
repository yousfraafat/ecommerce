import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/presentation/core/widgets/buttons/favorite_button.dart';
import 'package:flutter/material.dart';

typedef OnOfferChange = void Function(int);

class ProductImagesSlider extends StatefulWidget {
  List<String> images;
  int currentIndex;
  OnOfferChange onImageChange;

  ProductImagesSlider({
    required this.images,
    required this.currentIndex,
    required this.onImageChange,
    super.key,
  });

  @override
  State<ProductImagesSlider> createState() => _ProductImagesSliderState();
}

class _ProductImagesSliderState extends State<ProductImagesSlider> {
  final CarouselSliderController carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: widget.images.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: MyApp.mainColor.withOpacity(.3),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(widget.images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 300,
            enlargeCenterPage: false,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            autoPlay: false,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              widget.onImageChange(index);
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                widget.images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      widget.onImageChange(entry.key);
                    },
                    child:
                        entry.key == widget.currentIndex
                            ? Container(
                              width: 30,
                              height: 10,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: MyApp.mainColor,
                              ),
                            )
                            : Container(
                              width: 10,
                              height: 10,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: MyApp.mainColor),
                              ),
                            ),
                  );
                }).toList(),
          ),
        ),
        Positioned(top: 20, right: 20, child: FavoriteButton()),
      ],
    );
  }
}
