import 'package:fundro_app/common/widgets/custom_button.dart';
import 'package:fundro_app/common/widgets/custom_textfield.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/features/auth/domain/models/signup_body_model.dart';
import 'package:fundro_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: Dimensions.height * 0.02,
                children: [
                  CustomTextField(
                    controller: _fullNameController,

                    labelText: "full_name".tr,
                    prefixIcon: Icon(Icons.person_outline),
                    validator: (fullName) {
                      if (fullName!.isEmpty) {
                        return 'full_name_is_required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomTextField(
                    controller: _emailController,

                    labelText: "email".tr,
                    prefixIcon: Icon(Icons.email_outlined),
                    validator: (email) {
                      if (email!.isEmpty) {
                        return 'full_name_is_required';
                      } else if (!email.contains('@') || !email.contains('.')) {
                        return 'invalid_email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomTextField(
                    controller: _phoneController,

                    labelText: "phone_number".tr,
                    prefixIcon: Icon(Icons.phone_outlined),
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    validator: (phone) {
                      if (phone!.isEmpty) {
                        return 'phone_number_is_required';
                      } else if (phone.length < 11) {
                        return 'invalid_phone_number';
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomTextField(
                    controller: _passwordController,

                    labelText: "password".tr,
                    prefixIcon: Icon(Icons.lock_outline),
                    isPassword: true,
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
                  CustomTextField(
                    controller: _confirmPasswordController,

                    labelText: "confirm_password".tr,
                    prefixIcon: Icon(Icons.lock_outline),
                    isPassword: true,
                    validator: (confirmPassword) {
                      if (confirmPassword!.isEmpty) {
                        return 'confirm_password_is_required';
                      } else if (confirmPassword != _passwordController.text) {
                        return 'passwords_do_not_match';
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomButton(
                    isLoading: authController.isLoading,
                    text: "sign_up".tr,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authController.registration(
                          SignUpBodyModel(
                            name: _fullNameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            passwordConfirmation:
                                _confirmPasswordController.text,
                            phone: _phoneController.text,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
