// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:fundro_app/core/helper/custom_snackbar.dart';
// import 'package:fundro_app/core/utils/dimensions.dart';
// import 'package:fundro_app/core/utils/styles.dart';
// import 'package:fundro_app/features/auth/presentation/controller/auth_controller.dart';
// import 'package:fundro_app/features/auth/presentation/widgets/custom_button.dart';
// import 'package:pinput/pinput.dart';

// class OtpVerificationScreen extends StatefulWidget {
//   final String phoneNumber;

//   const OtpVerificationScreen({super.key, required this.phoneNumber});

//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }

// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   final TextEditingController _otpController = TextEditingController();

//   int _secondsRemaining = 60;
//   bool _canResend = false;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _otpController.dispose();
//     super.dispose();
//   }

//   void _startTimer() {
//     setState(() {
//       _secondsRemaining = 60;
//       _canResend = false;
//     });

//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_secondsRemaining > 0) {
//         setState(() {
//           _secondsRemaining--;
//         });
//       } else {
//         setState(() {
//           _canResend = true;
//         });
//         timer.cancel();
//       }
//     });
//   }

//   void _verifyOtp(AuthController authController) {
//     String otp = _otpController.text.trim();

//     if (otp.length == 6) {
//       authController.verfiy(widget.phoneNumber, otp);
//     } else {
//       showCustomSnackBar('must_enter_6_digits'.tr);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('يرجى إدخال كود مكون من 6 أرقام')),
//       );
//     }
//   }

//   void _resendCode(AuthController authController) {
//     authController.resendOtp(widget.phoneNumber);

//     _startTimer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 50,
//       height: 60,
//       textStyle: cairoRegular,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade400),
//         borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(title: Text("verify_otp".tr), centerTitle: true),
//       body: GetBuilder<AuthController>(
//         builder: (authController) {
//           return Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 30),
//                   Text(
//                     "write_otp_sent_to_your_phone_number".tr,
//                     textAlign: TextAlign.center,
//                     style: cairoRegular,
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     widget.phoneNumber,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   Pinput(
//                     length: 6,
//                     controller: _otpController,
//                     defaultPinTheme: defaultPinTheme,
//                     focusedPinTheme: defaultPinTheme.copyWith(
//                       decoration: defaultPinTheme.decoration!.copyWith(
//                         border: Border.all(
//                           color: Theme.of(context).primaryColor,
//                         ),
//                       ),
//                     ),
//                     submittedPinTheme: defaultPinTheme.copyWith(
//                       decoration: defaultPinTheme.decoration!.copyWith(
//                         border: Border.all(
//                           color: Theme.of(context).primaryColor,
//                         ),
//                       ),
//                     ),

//                     showCursor: true,
//                     onCompleted: (pin) {
//                       _verifyOtp(authController);
//                     },
//                   ),

//                   const SizedBox(height: 30),
//                   CustomButton(
//                     isLoading: authController.isLoading,
//                     text: "verify".tr,
//                     onPressed: () {
//                       if (!authController.isLoading) {
//                         _verifyOtp(authController);
//                       }
//                     },
//                   ),

//                   const SizedBox(height: 25),

//                   _canResend
//                       ? TextButton(
//                           onPressed: () {
//                             _resendCode(authController);
//                           },
//                           child: Text(
//                             "resnd_otp".tr,
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Theme.of(context).primaryColor,
//                             ),
//                           ),
//                         )
//                       : Text(
//                           "${"you_can_resend_within".tr} $_secondsRemaining${'s'.tr}",
//                           style: const TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey,
//                           ),
//                         ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
