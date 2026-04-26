import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fundro_app/core/utils/images.dart';

class RewardsBannerCarousel extends StatefulWidget {
  const RewardsBannerCarousel({super.key});

  @override
  State<RewardsBannerCarousel> createState() => _RewardsBannerCarouselState();
}

class _RewardsBannerCarouselState extends State<RewardsBannerCarousel> {
  int activeIndex = 0;

  final banners = [
    {"title": "رصيد المكافآت", "amount": "AED 1000.00"},
    {"title": "رصيد المحفظة", "amount": "AED 5000.00"},
    {"title": "إجمالي الاستثمارات", "amount": "AED 6000.00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: banners.length,
          itemBuilder: (context, index, realIndex) {
            final banner = banners[index];
            return _buildBannerItem(banner['title']!, banner['amount']!);
          },
          options: CarouselOptions(
            height: 180,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: activeIndex == index
                    ? const Color(0xFF1ED794)
                    : Colors.white,
                border: activeIndex == index
                    ? null
                    : Border.all(color: Colors.grey, width: 1),
              ),
            );
          }),
        ),
      
      
      ],
    );
  }

  Widget _buildBannerItem(String title, String amount) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
        gradient: const LinearGradient(
          colors: [Color(0xFF10E59A), Color(0xFF10704A)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          // Background Pattern (Repeated Logo)
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return Transform.rotate(
                    angle: -0.2, // Subtle tilt
                    child: Image.asset(Images.logo, color: Colors.white),
                  );
                },
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Cairo',
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  amount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
