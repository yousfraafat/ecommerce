import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

typedef OnOfferChange = void Function(int);

class CustomOffersWidget extends StatefulWidget {
  List<Offer> offers;
  int currentIndex;
  OnOfferChange onOfferChange;

  CustomOffersWidget({
    required this.currentIndex,
    required this.offers,
    required this.onOfferChange,
    super.key,
  });

  @override
  State<CustomOffersWidget> createState() => _CustomOffersWidgetState();
}

class _CustomOffersWidgetState extends State<CustomOffersWidget> {
  final CarouselSliderController carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: widget.offers.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return AnimatedOpacity(
              opacity: index == widget.currentIndex ? 1 : 0,
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInBack,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(widget.offers[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(
                      widget.offers[index].text,
                      style: TextStyle(
                        color: MyApp.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'shop now',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: MyApp.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 250,
            enlargeCenterPage: false,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 10),
            autoPlayCurve: Curves.easeInOut,
            pauseAutoPlayOnManualNavigate: true,
            pauseAutoPlayOnTouch: true,
            scrollPhysics: NeverScrollableScrollPhysics(),
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              widget.onOfferChange(index);
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
                widget.offers.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      widget.onOfferChange(entry.key);
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            entry.key == widget.currentIndex
                                ? MyApp.mainColor
                                : Colors.white,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}

class Offer {
  String image;
  String text;

  Offer({required this.text, required this.image});
}
