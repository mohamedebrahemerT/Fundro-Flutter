import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundro_app/core/utils/dimensions.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final Color? labelColor;
  final TextEditingController controller;
  final bool isPassword;
  final bool readOnly;
  final double? radius;
  final Color? fillColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? borderColor;
  final double? fontSize;
  final double? width;
  final void Function()? onTap;
  final int? maxLength;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters; // ✅ تمت الإضافة هنا

  const CustomTextField({
    super.key,
    this.hintText,
    required this.controller,
    this.labelText,
    this.labelColor,
    this.isPassword = false,
    this.readOnly = false,
    this.radius,
    this.onTap,
    this.fillColor,
    this.textColor,
    this.hintColor,
    this.borderColor,
    this.fontSize,
    this.width,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.inputFormatters, // ✅ أضفناها هنا
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final double radius = widget.radius ?? 18;
    final Color fillColor = widget.fillColor ?? Colors.black.withOpacity(0.05);
    final Color textColor = widget.textColor ?? Colors.black;
    final Color hintColor = widget.hintColor ?? Colors.grey;
    final Color borderColor = widget.borderColor ?? Colors.black26;
    final double fontSize = widget.fontSize ?? Dimensions.fontSizeDefault;
    final Color labelColor = widget.labelColor ?? Colors.grey.shade700;

    OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: borderColor, width: 1.5),
    );

    Widget textField = TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscured : false,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters, // ✅ تمت الإضافة هنا
      decoration: InputDecoration(
        counterText: "",
        labelText: widget.labelText,
        labelStyle: TextStyle(color: labelColor, fontSize: fontSize * 0.9),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: hintColor, fontSize: fontSize * 0.9),
        filled: true,
        fillColor: fillColor,
        border: customBorder,
        enabledBorder: customBorder,
        focusedBorder: customBorder,
        errorBorder: customBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword && !widget.readOnly
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  color: textColor,
                ),
                onPressed: () {
                  setState(() => _isObscured = !_isObscured);
                },
              )
            : widget.suffixIcon,
      ),
      style: TextStyle(fontSize: fontSize, color: textColor),
    );

    return SizedBox(
      width: widget.width ?? Dimensions.width * 0.9,
      child: textField,
    );
  }
}
