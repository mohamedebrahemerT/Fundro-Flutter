// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:fundro_app/common/widgets/custom_cached_image.dart';
// import 'package:fundro_app/common/widgets/custom_slider_shimmer.dart';

// class CustomSlider extends StatefulWidget {
//   final List<String> images;
//   final Duration autoSlideDuration;

//   const CustomSlider({super.key, 
//     required this.images,
//     this.autoSlideDuration = const Duration(seconds: 3),
//   });

//   @override
//   _CustomSliderState createState() => _CustomSliderState();
// }

// class _CustomSliderState extends State<CustomSlider> {
//   late PageController _pageController;
//   int _currentPage = 0;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _startAutoSlide();
//     });
//   }

//   void _startAutoSlide() {
//     _timer = Timer.periodic(widget.autoSlideDuration, (timer) {
//       if (!mounted) return;
//       if (_pageController.positions.isEmpty) return; // تأمين زيادة

//       if (_currentPage < widget.images.length - 1) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }

//       _pageController.animateToPage(
//         _currentPage,
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(builder: (homeController){
//       return homeController.isLoading?CustomSliderShimmer(): homeController.modules[homeController.selectedIndexModule].slider.isEmpty?SizedBox(): SizedBox(
//       width: double.infinity,
//       height: 200,
//       child: PageView.builder(
//         controller: _pageController,
//         itemCount: homeController.modules[homeController.selectedIndexModule].slider.length,
//         itemBuilder: (context, index) {
//           return CustomCachedImage(
//             imageUrl: homeController.modules[homeController.selectedIndexModule].slider[index],
            
//             height: 150,
//             width: 250,
//             );
          
//         },
//       ),
//     );
//     });
//   }
// }
