// import 'package:flutter/material.dart';
// import 'package:fundro_app/features/auth/presentation/controller/auth_controller.dart';
// import 'package:fundro_app/features/auth/presentation/screens/sign_in_with_pone_screen.dart';
// import 'package:fundro_app/features/auth/presentation/widgets/social_media_login_widget.dart';
// import 'package:fundro_app/core/utils/dimensions.dart';
// import 'package:fundro_app/core/utils/images.dart';
// import 'package:get/get.dart' hide Response;
// import 'package:fundro_app/core/utils/styles.dart';

// class SignInScreen extends StatelessWidget {
//   SignInScreen({super.key});

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   // final TextEditingController _emailController = TextEditingController();
//   // final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: GetBuilder<AuthController>(
//         builder: (authController) {
//           return Container(
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             // decoration: BoxDecoration(
//             //   image: DecorationImage(
//             //     image: AssetImage(Images.loginBackground),
//             //     fit: BoxFit.cover,
//             //   ),
//             // ),
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: Dimensions.paddingSizeDefault,
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   spacing: Dimensions.height * 0.01,
//                   children: [
//                     const SizedBox(
//                       height: Dimensions.paddingSizeExtraOverLarge,
//                     ),
//                     Image.asset(Images.logo, width: Dimensions.width*0.6, height: Dimensions.height*0.2),
//                      SizedBox(height: Dimensions.height*0.01),
//                     Text(
//                       "hey_there".tr,
//                       style: cairoBold.copyWith(
//                         fontSize: Dimensions.fontSizeExtraLarge,
//                         // color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       width: Dimensions.width * 0.5,
//                       child: Text(
//                         "log_in_or_sign_up_for_a_more_personalized_experience".tr,
//                         textAlign: TextAlign.center,
//                         style: cairoRegular.copyWith(
//                           fontSize: Dimensions.fontSizeSmall,
//                           // color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     // const SizedBox(height: 30),
//                     // CustomTextField(
//                     //   hintText: "phone_or_email".tr,
//                     //   //  hintColor: Colors.white,
//                     //   // textColor: Colors.white,
//                     //   borderColor: Theme.of(context).hintColor,
//                     //   controller: _emailController,
//                     //   validator: (value) {
//                     //     if (value == null || value.isEmpty) {
//                     //       return "Phone or Email is required";
//                     //     }
//                     //     if (!GetUtils.isEmail(value) && value.length < 10) {
//                     //       return "Enter a valid email or phone";
//                     //     }
//                     //     return null;
//                     //   },
//                     // ),
//                     // CustomTextField(
//                     //   hintText: "password".tr,
//                     //   // hintColor: Colors.white,
//                     //   // textColor: Colors.white,
//                     //   controller: _passwordController,
//                     //   borderColor: Theme.of(context).hintColor,
//                     //   isPassword: true,
//                     //   validator: (value) {
//                     //     if (value == null || value.isEmpty) {
//                     //       return "Password is required";
//                     //     }
//                     //     if (value.length < 6) {
//                     //       return "Password must be at least 6 characters";
//                     //     }
//                     //     return null;
//                     //   },
//                     // ),
//                      SizedBox(height: Dimensions.height*0.07),
                    
//                         SocialMediaLoginWidget(
//                           icon: Images.phoneIcon,
//                           label: "login_with_phone_number".tr,
//                           onTap: () {
//                             Get.to(()=>SignInWithPhoneScreen());
//                           },
//                         ),
//                         // SocialMediaLoginWidget(
//                         //   icon: Images.emailIcon,
//                         //   label: "login_with_email".tr,
//                         // ),
//                         SocialMediaLoginWidget(
//                           icon: Images.googleIcon,
//                           label: "login_with_google".tr,
//                         ),
//                         SocialMediaLoginWidget(
//                           icon: Images.appleIcon,
//                           label: "login_with_apple".tr,
//                         ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     //   children: [
//                     //     SocialMediaLoginWidget(
//                     //       icon: Images.googleIcon,
//                     //       label: "login_with_google".tr,
//                     //     ),
//                     //     SocialMediaLoginWidget(
//                     //       icon: Images.appleIcon,
//                     //       label: "login_with_apple".tr,
//                     //     ),
//                     //   ],
//                     // ),
//                     // const SizedBox(height: 40),
//                     // CustomButton(
//                     //   text: "login".tr,
//                     //   isLoading: authController.isLoading,
//                     //   height: Dimensions.height * 0.05,
//                     //   // color: Colors.blueAccent,
//                     //   onPressed: authController.isLoading
//                     //       ? null
//                     //       : () {
//                     //         Get.to(()=>OtpVerificationScreen(phoneNumber: "phoneNumber"));
//                     //           // if (_formKey.currentState!.validate()) {
//                     //           // authController.login(
//                     //           //   _emailController.text.trim(),
//                     //           //   _passwordController.text.trim(),
//                     //           // );
//                     //           // }

//                     //           // ApiService ap = ApiService();
//                     //           // ap.signup({
//                     //           //   "email":"ahmed22@gmail.com3",
//                     //           //   "password":"12345678",
//                     //           //   "phone":"01099527790",
//                     //           //   "name":"ahmed diab",
//                     //           //   "role":"Customer"
//                     //           // });
//                     //         },
//                     // ),
                  
                  
//                     // const SizedBox(height: 15),
//                     // CustomTextButton(text: "forgot_password".tr),
//                     // CustomTextButton(
//                     //   text: "sign_up".tr,
//                     //   onTap: () {
//                     //     Get.to(() => SignUpScreen());
//                     //   },
//                     // ),
//                     // SizedBox(height: Dimensions.height * 0.05),
//                     // CustomTextButton(
//                     //   text: "geust".tr,
//                     //   onTap: () {
//                     //     Get.offAll(
//                     //       () => MainLayout(),
//                     //       transition: Transition.rightToLeftWithFade,
//                     //     );
//                     //   },
//                     // ),
//                     // SizedBox(height: Dimensions.height * 0.05),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

