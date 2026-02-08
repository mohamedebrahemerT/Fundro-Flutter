import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fundro_app/features/search/presentation/screens/search_screen.dart';

class CustomSearchField extends StatefulWidget {
  final dynamic hintText; 
  final TextEditingController controller;
  final double width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;
  final Color? fillColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? iconColor;
  final Color? borderColor;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;

  const CustomSearchField({
    super.key,
    required this.hintText,
    required this.controller,
    this.width = 350,
    this.height,
    this.contentPadding,
    this.borderRadius = 18,
    this.fillColor,
    this.textColor,
    this.hintColor,
    this.iconColor,
    this.borderColor,
    this.hintTextStyle,
    this.textStyle,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  int _currentHintIndex = 0;
  Timer? _timer;
  List<String> _hints = [];

  @override
  void initState() {
    super.initState();

    if (widget.hintText is List<String>) {
      _hints = widget.hintText;
    } else if (widget.hintText is String) {
      _hints = [widget.hintText];
    } else {
      throw ArgumentError("hintText must be either String or List<String>");
    }

    if (_hints.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        setState(() {
          _currentHintIndex = (_currentHintIndex + 1) % _hints.length;
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultFillColor = widget.fillColor ?? Colors.black.withOpacity(0.3);
    final defaultTextColor = widget.textColor ?? Theme.of(context).primaryColor;
    final defaultHintColor = widget.hintColor ?? Theme.of(context).primaryColor;
    final defaultIconColor = widget.iconColor ?? Theme.of(context).primaryColor;
    final defaultBorderColor =
        widget.borderColor ?? Theme.of(context).primaryColor.withOpacity(0.6);

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: const Border(
          bottom: BorderSide(color: Colors.orange, width: 0.5),
        ),
      ),
      child: TextField(
        readOnly: true,
        onTap: () {
          showSearch(
            context: context,
            delegate: SearchScreen(),
          );
        },
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: _hints[_currentHintIndex],
          filled: true,
          fillColor: defaultFillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(color: defaultBorderColor, width: 2),
          ),
          hintStyle: widget.hintTextStyle ??
              TextStyle(color: defaultHintColor, fontSize: 16),
          prefixIcon: Icon(Icons.search, color: defaultIconColor),
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
        style: widget.textStyle ??
            TextStyle(
              fontSize: 16,
              color: defaultTextColor,
            ),
      ),
    );
  }
}
