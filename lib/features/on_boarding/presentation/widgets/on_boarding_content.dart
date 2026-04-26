import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/features/on_boarding/domain/models/on_boarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: Dimensions.height * 0.1,
          width: Dimensions.width * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        // SizedBox(height: size.height * 0.1),
        Image.asset(model.image, height: size.height * 0.3, scale: 0.9),
        // SizedBox(height: 20),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
            color: Color(0xFF00A269),
          ),
        ),
        if (model.description.isNotEmpty) ...[
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              model.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, color: Color(0xFF5E747C)),
            ),
          ),
        ],
      ],
    );
  }
}
