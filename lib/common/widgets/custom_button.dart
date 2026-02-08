import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/dimensions.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final double? width;
  final double? height;
  final bool isLoading;
  final double borderRadius;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color =  Colors.red,
    this.width,
    this.isLoading = false,
    this.height,
    this.borderRadius = 10,
    this.textStyle ,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width ?? Dimensions.width * 0.7,
        height: widget.height ?? Dimensions.height * 0.05,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.7),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                    spreadRadius: 4,
                  ),
                ]
              : [
                  BoxShadow(
                    color: widget.color.withOpacity(0.3),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                  ),
                ],
        ),
        child: Center(
          child:widget.isLoading?SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(color: Colors.white,)): Text(
            widget.text,
            style: widget.textStyle ??
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeLarge,
                ),
          ),
        ),
      ),
    );
  }
}
