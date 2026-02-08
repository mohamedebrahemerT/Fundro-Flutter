 import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> showCustomDialog(BuildContext context,String title , String subTitle,void Function() onTap) {
    return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title:  Text(title.tr),
        content:  Text(subTitle.tr),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child:  Text("no".tr),
          ),
          ElevatedButton(
            onPressed: () {
              onTap();
              Navigator.of(context).pop(); 
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child:  Text("yes".tr),
          ),
        ],
      );
    },
  );
  }
