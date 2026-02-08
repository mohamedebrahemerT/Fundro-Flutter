import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:fundro_app/core/utils/dimensions.dart';

String? _lastShownMessage; // 🧠 لتخزين آخر رسالة تم عرضها

void showCustomSnackBar(String? message,
    {bool isError = true, bool getXSnackBar = false}) {
  if (message == null || message.isEmpty) return;

  // ✅ لو نفس الرسالة اللي ظهرت قبل كده، ما تظهرش تاني
  if (_lastShownMessage == message) return;
  _lastShownMessage = message;

  final icon = isError ? Icons.error_outline : Icons.check_circle_outline;
  final bgGradient = isError
      ? [Colors.red.shade400, Colors.red.shade600]
      : [Colors.green.shade400, Colors.green.shade600];

  if (getXSnackBar) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: Colors.transparent,
        snackStyle: SnackStyle.FLOATING,
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeSmall,
          vertical: 10,
        ),
        borderRadius: Dimensions.radiusDefault,
        isDismissible: true,
        duration: const Duration(seconds: 3),
        messageText: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: bgGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.closeAllSnackbars(),
                child: const Icon(Icons.close, color: Colors.white70, size: 18),
              ),
            ],
          ),
        ),
      ),
    );

    // 🧹 امسح آخر رسالة بعد انتهاء المدة
    Future.delayed(const Duration(seconds: 3), () {
      _lastShownMessage = null;
    });
  } else {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeSmall,
          vertical: 10,
        ),
        content: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 300),
          builder: (context, value, child) => Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, (1 - value) * 20),
              child: child,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: bgGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        duration: const Duration(seconds: 3),
      ),
    ).closed.then((_) {
      _lastShownMessage = null;
    });
  }
}
