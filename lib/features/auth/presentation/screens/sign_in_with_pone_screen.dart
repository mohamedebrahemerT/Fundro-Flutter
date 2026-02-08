// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:fundro_app/core/helper/custom_snackbar.dart';
// import 'package:fundro_app/core/utils/dimensions.dart';
// import 'package:fundro_app/core/utils/imports.dart';
// import 'package:fundro_app/features/auth/presentation/widgets/custom_button.dart';
// import 'package:fundro_app/features/auth/presentation/widgets/custom_textfield.dart';

// class SignInWithPhoneScreen extends StatefulWidget {
//   const SignInWithPhoneScreen({super.key});

//   @override
//   State<SignInWithPhoneScreen> createState() => _SignInWithPhoneScreenState();
// }

// class _SignInWithPhoneScreenState extends State<SignInWithPhoneScreen> {
//   final TextEditingController _phoneController = TextEditingController();

//   void _sendOtp(AuthController authController) {
//     String phone = _phoneController.text.trim();
//     if (phone.isEmpty || phone.length < 11) {
//     showCustomSnackBar("enter_valid_phone_number".tr);
//       return;
//     }
//     authController.loginWithOtp(phone);
// // Get.to(() => OtpVerificationScreen(phoneNumber: phone));
//     // ScaffoldMessenger.of(
//     //   context,
//     // ).showSnackBar(SnackBar(content: Text('تم إرسال رمز التحقق إلى $phone')));
    
//     // Navigator.push(context, MaterialPageRoute(builder: (_) => OtpVerificationScreen(phoneNumber: phone)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
//         child: GetBuilder<AuthController>(
//           builder: (authController) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               // mainAxisAlignment: MainAxisAlignment.center,
//               spacing: Dimensions.height * 0.01,
//               children: [
//                 Text(
//                   'enter_your_phone_number_to_continue'.tr,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                   textAlign: TextAlign.center,
//                 ),
//                 CustomTextField(
//                   prefixIcon: const Icon(Icons.phone_android),
//                   fillColor: Theme.of(context).cardColor,
//                   keyboardType: TextInputType.phone,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(11),
//                   ],
//                   hintText: "phone".tr,
//                   controller: _phoneController,
//                 ),

//                 CustomButton(
//                   isLoading: authController.isLoading,
//                   text: "send_otp".tr,
//                   onPressed: () {
//                     _sendOtp(authController);
//                   },
//                 ),

       
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
