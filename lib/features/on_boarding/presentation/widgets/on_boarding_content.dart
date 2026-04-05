import 'package:flutter/material.dart';
import 'package:fundro_app/features/on_boarding/domain/models/on_boarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          // width: Dimensions.width * 0.1,
        ),
        SizedBox(height: size.height * 0.1),
        Image.asset(model.image, height: size.height * 0.35),
        SizedBox(height: 40),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF006D44),
          ),
        ),
        if (model.description.isNotEmpty) ...[
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              model.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
        ],
      ],
    );
  }
}
