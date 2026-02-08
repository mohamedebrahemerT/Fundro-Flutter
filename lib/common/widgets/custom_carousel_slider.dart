import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class CustomCarouselSlider extends StatefulWidget {
  // CarouselSliderController buttonCarouselController = CarouselSliderController();

   const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;

  // Define your carousel items here
  final List<Widget> _carouselItems = [
    // Item 1 with a large border radius to make it circular
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        image: const DecorationImage(
          image: AssetImage(Images.banner1),
          fit: BoxFit.fill,
        ),
      ),
    ),
    // Item 2 with a smaller border radius
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        image: const DecorationImage(
          image: AssetImage(Images.banner2),
          fit: BoxFit.fill,
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        image: const DecorationImage(
          image: AssetImage(Images.banner3),
          fit: BoxFit.fill,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CarouselSlider(
          items: _carouselItems,
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 0.95,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          )),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_carouselItems.length, (index) {
          return Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).hintColor),
          );
        }),
      )
    ]);
  }
}