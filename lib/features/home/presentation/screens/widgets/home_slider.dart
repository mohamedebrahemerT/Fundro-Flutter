import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int currentIndex = 0;

  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final List<String> images = [
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
    'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
    'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Slider
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: images.length,
          options: CarouselOptions(
            height: 520,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: (index, reason) {
              setState(() => currentIndex = index);
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.network(images[index], fit: BoxFit.cover),
                Container(color: Colors.black.withOpacity(0.25)),
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SPRING ESSENTIALS',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'TIMELESS PIECES\nFOR EVERY SEASON',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 14,
                          ),
                        ),
                        onPressed: () {
                          _carouselController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text('SHOP NOW'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),

        /// Left Arrow
        // Positioned(
        //   left: 10,
        //   top: 0,
        //   bottom: 0,
        //   child: IconButton(
        //     icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        //     onPressed: () {
        //       currentIndex--;
        //       setState(() {});
        //       // _carouselController.previousPage(
        //       //   duration: const Duration(milliseconds: 400),
        //       //   curve: Curves.easeInOut,
        //       // );
        //     },
        //   ),
        // ),

        // /// Right Arrow
        // Positioned(
        //   right: 10,
        //   top: 0,
        //   bottom: 0,
        //   child: IconButton(
        //     icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        //     onPressed: () {
        //       currentIndex++;
        //       setState(() {});
        //       // _carouselController.nextPage(
        //       //   duration: const Duration(milliseconds: 400),
        //       //   curve: Curves.easeInOut,
        //       // );
        //     },
        //   ),
        // ),

        /// Indicator
        Positioned(
          bottom: 24,
          left: 0,
          right: 0,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: images.length,
              effect: ExpandingDotsEffect(
                dotHeight: 6,
                dotWidth: 6,
                activeDotColor: Colors.white,
                dotColor: Colors.white.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
