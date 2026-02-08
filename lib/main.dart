import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fundro_app/common/controllers/theme_controllers.dart';
import 'package:fundro_app/common/widgets/main_layout.dart';
import 'package:fundro_app/core/helper/responsive_helper.dart';
import 'package:fundro_app/core/utils/app_constants.dart';
import 'package:fundro_app/core/utils/messages.dart';
import 'package:fundro_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:fundro_app/features/language/presentation/controllers/language_controller.dart';
import 'package:fundro_app/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:fundro_app/theme/dark_theme.dart';
import 'package:fundro_app/theme/light_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/helper/get_di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    if (ResponsiveHelper.isMobilePhone()) {
    HttpOverrides.global = MyHttpOverrides();
  }
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // await NotificationHelper.initNotifications();

  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);


  Map<String, Map<String, String>> languages = await di.init();
  //   runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => brand_deals(languages: languages,),
  //   ),
  // );
  // runApp(brand_deals(languages: null));
  runApp(brand_deals(languages: languages));
}

class brand_deals extends StatelessWidget {
  const brand_deals({super.key, required this.languages});
  // final LanguageRepositoryInterface? repo;
  final Map<String, Map<String, String>>? languages;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetBuilder<LanguageController>(
          builder: (languageController) {
            return GetMaterialApp(
              translations: Messages(languages: languages),
              locale: languageController.locale,
              fallbackLocale: Locale(
                AppConstants.languages[0].code,
                AppConstants.languages[0].countryCode,
              ),
              theme:light(),
              // theme: themeController.darkTheme ? dark() : light(),
              debugShowCheckedModeBanner: false,
              builder: (context, child) {
                return SafeArea(child: child ?? const SizedBox());
              },
              // home:  UpdateAppScreen(),
              // home: SplashScreen(),
              // home:  initRoute(),
              home: OnboardingScreen(),
              // home: MainLayout(),
              // home: MainLayout(),
            );
          },
        );
      },
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void handleError() {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      print("Caught an error in a widget: ${details.exceptionAsString()}");
    }
    FlutterError.presentError(details);
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.error_outline_outlined, color: Colors.red, size: 34),
        const SizedBox(height: 10),
        const Text(
          'Oops! Something went wrong.',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          '${details.exception}',
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  };
}



// import 'package:flutter/material.dart';
// import 'package:fundro_app/services/auth_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:fundro_app/core/utils/app_constants.dart';
// import 'package:fundro_app/core/utils/messages.dart';
// import 'package:fundro_app/features/language/presentation/controllers/language_controller.dart';
// import 'package:fundro_app/features/on_boarding/presentation/screens/on_boarding_screen.dart';
// import 'package:fundro_app/services/signup_screen.dart';
// import 'package:fundro_app/theme/dark_theme.dart';
// import 'package:fundro_app/theme/light_theme.dart';
// import 'helper/get_di.dart' as di;


// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Map<String, Map<String, String>> languages = await di.init();

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         // ChangeNotifierProvider(create: (_) => LanguageController()),
//         // ChangeNotifierProvider(create: (_) => ThemeController()),
//       ],
//       child: brand_deals(languages: languages),
//     ),
//   );
// }

// class brand_deals extends StatelessWidget {
//   const brand_deals({super.key, required this.languages});
//   final Map<String, Map<String, String>>? languages;

//   @override
//   Widget build(BuildContext context) {
//     // final themeController = Provider.of<ThemeController>(context);
//     // final languageController = Provider.of<LanguageController>(context);

//     return MaterialApp(
//       // translations: Messages(languages: languages),
//       // locale: languageController.locale,
//       // fallbackLocale: Locale(
//         // AppConstants.languages[0].code,
//         // AppConstants.languages[0].countryCode,
//       // ),
//       // theme: themeController.darkTheme ? dark() : light(),
//       debugShowCheckedModeBanner: false,
//       home: SignupScreen(),
//     );
//   }
// }
