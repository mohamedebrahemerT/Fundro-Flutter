import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:fundro_app/features/auth/presentation/screens/sign_in_screen2.dart';
import 'package:fundro_app/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
class NotLoginScreen extends StatelessWidget {
  const NotLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: Dimensions.height*0.01,
              children: [
                Text("you_aren't_logged_in".tr,style: cairoBold.copyWith(fontSize: Dimensions.fontSizeLarge,)),
                Text("you_should_login_to_follow".tr,style: cairoRegular.copyWith(color: Theme.of(context).hintColor,fontSize: Dimensions.fontSizeSmall)),
                CustomButton(
                  width: Dimensions.width * 0.5,
                  text: "login".tr, onPressed: (){
                  Get.to(()=>SignInScreen());
                })
              ],
          ),
        ),
      );
  }
}