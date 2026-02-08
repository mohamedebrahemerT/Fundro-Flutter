import 'package:fundro_app/common/widgets/custom_button.dart';
import 'package:fundro_app/common/widgets/custom_text_button.dart';
import 'package:fundro_app/common/widgets/custom_textfield.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:fundro_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return Form(
            key: _formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeLarge,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: Dimensions.height * 0.02,
                  children: [
                    CustomTextField(
                      prefixIcon: Icon(Icons.email_outlined),
                      width: Dimensions.width * 0.9,
                      controller: _emailController,
                      labelText: "email".tr,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'full_name_is_required';
                        } else if (!email.contains('@') ||
                            !email.contains('.')) {
                          return 'invalid_email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextField(
                      isPassword: true,
                      prefixIcon: Icon(Icons.lock_outline),
                      controller: _passwordController,
                      labelText: "password".tr,
                      validator: (password) {
                        if (password!.isEmpty) {
                          return 'password_is_required';
                        } else if (password.length < 8) {
                          return 'password_must_be_at_least_8_characters';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [CustomTextButton(text: "forgot_password".tr)],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: "sign_in".tr,
                          isLoading: authController.isLoading,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              authController.login(
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                            // Get.to(()=>HomeScreen());
                          },
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: Dimensions.width * 0.02,
                      children: [
                        Text("dont't_have_an_account".tr),
                        CustomTextButton(
                          text: "sign_up".tr,
                          onTap: () {
                            Get.to(() => SignUpScreen());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
