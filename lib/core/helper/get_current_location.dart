// import 'package:geolocator/geolocator.dart';

// Future<Position?> getCurrentLocation() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     await Geolocator.openLocationSettings();
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, cannot request permissions.');
//   }

//   return await Geolocator.getCurrentPosition(
//     desiredAccuracy: LocationAccuracy.high,
//   );
// }
// /*
// import 'package:geolocator/geolocator.dart';

// Future<Position?> getCurrentLocation() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // تأكد إن خدمة الموقع شغالة
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     await Geolocator.openLocationSettings();
//     return Future.error('Location services are disabled.');
//   }

//   // تحقق من الصلاحيات واطلبها لو مرفوضة
//   permission = await Geolocator.checkPermission();

//   // لو مرفوضة، نفضل نطلبها تاني لحد ما المستخدم يوافق أو يختار "رفض دائم"
//   while (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//   }

//   // لو رفض دائم، نفتح إعدادات التطبيق عشان يغيرها يدوي
//   if (permission == LocationPermission.deniedForever) {
//     await Geolocator.openAppSettings();
//     return Future.error(
//       'Location permissions are permanently denied. Please enable them from settings.',
//     );
//   }

//   // رجّع الموقع الحالي بدقة عالية
//   return await Geolocator.getCurrentPosition(
//     desiredAccuracy: LocationAccuracy.high,
//   );
// }


// */