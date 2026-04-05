import 'package:flutter/material.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/form_input_field.dart';
import 'package:fundro_app/features/home/presentation/screens/review_details_screen.dart';

class EmployerAddressConfirmationScreen extends StatefulWidget {
  const EmployerAddressConfirmationScreen({super.key});

  @override
  State<EmployerAddressConfirmationScreen> createState() =>
      _EmployerAddressConfirmationScreenState();
}

class _EmployerAddressConfirmationScreenState
    extends State<EmployerAddressConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                  ),
                  const Text(
                    "تفاصيل عملك",
                    style: TextStyle(
                      color: Color(0xFF1ED794),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    const Text(
                      "قم بتأكيد عنوان صاحب العمل الخاص بك",
                      style: TextStyle(
                        color: Color(0xFF1ED794),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 12),

                    Text(
                      "يرجى تأكيد تفاصيل عنوان صاحب العمل الخاص بك للتأكد من أن لدينا معلومات دقيقة",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                        height: 1.5,
                      ),
                      textDirection: TextDirection.rtl,
                    ),

                    const SizedBox(height: 30),

                    // State/Country Field
                    const FormInputField(
                      label: "الدولة",
                      hintText: "Saudi Arabia",
                      readOnly: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("🇸🇦", style: TextStyle(fontSize: 18)),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Street Address Field (Error State)
                    const FormInputField(
                      label: "عنوان الشارع",
                      hintText: "على سبيل المثال: باركواي ريزيدنس",
                      isError: true,
                      errorText: "يرجى إدخال عنوان الشارع",
                    ),

                    const SizedBox(height: 20),

                    // Apt/Unit
                    FormInputField(
                      label: "الشقة / الطابق / الوحدة",
                      hintText: "على سبيل المثال: شقة 5ب",
                      suffixIcon: Icon(
                        Icons.edit_outlined,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // City / Region (Error State)
                    FormInputField(
                      label: "المدينة / المنطقة",
                      hintText: "على سبيل المثال: ماونتن فيو",
                      isError: true,
                      errorText: "يرجى إدخال المدينة / المنطقة",
                      suffixIcon: Icon(
                        Icons.edit_outlined,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Zip code
                    FormInputField(
                      label: "رمز بريدي",
                      hintText: "رمز بريدي",
                      suffixIcon: Icon(
                        Icons.edit_outlined,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Page Indicators
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFF1ED794),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReviewDetailsScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9EA3A5),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "المتابعة",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
