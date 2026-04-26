import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/core/utils/images.dart';
// import 'package:fundro_app/features/home/presentation/screens/select_country_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/select_currency_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/confirm_bank_details_screen.dart';

class AddBankAccountScreen extends StatefulWidget {
  const AddBankAccountScreen({super.key});

  @override
  State<AddBankAccountScreen> createState() => _AddBankAccountScreenState();
}

class _AddBankAccountScreenState extends State<AddBankAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Custom AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  Text(
                    "أضف حساب مصرفي",
                    style: cairoBold.copyWith(
                      color: const Color(0xFF1ED794),
                      fontSize: 22,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 22,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Full Name
                    _buildLabel("الأسم الكامل"),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFFFD144)),
                      ),
                      child: TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "جون سميث",
                          hintStyle: cairoRegular.copyWith(
                            color: Colors.grey[300],
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    _buildSubNote(
                      "يجب أن يتطابق مع الاسم الموجود في الحساب المصرفي",
                    ),

                    const SizedBox(height: 15),

                    // Country
                    _buildLabel("البلد"),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const SelectCountryScreen(),
                        //   ),
                        // );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Saudi Arabia",
                              style: cairoRegular.copyWith(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "+966",
                                  style: cairoRegular.copyWith(
                                    color: const Color(0xFF2C5E7A),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  "|",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(width: 5),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(2),
                                  child: Image.asset(
                                    Images.arabic,
                                    width: 24,
                                    height: 16,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Currency
                    _buildLabel("عملة حسابك المصرفي"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectCurrencyScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "يرجي الإختيار",
                              style: cairoRegular.copyWith(
                                color: Colors.grey[300],
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // IBAN
                    _buildLabel("IBAN", isEnglish: true),
                    _buildInputWithIcon(
                      hint: "AE00000000000000000000000000",
                      icon: Icons.edit_note,
                    ),
                    _buildSubNote("الخاص بك IBAN أدخل ال"),

                    const SizedBox(height: 15),

                    // Account Number
                    _buildLabel("(IBAN) رقم الحساب"),
                    _buildInputWithIcon(
                      hint: "US12 . . . . . . . . 3456",
                      icon: null,
                    ),
                    _buildSubNote("بحد أقصى 16 رقم"),

                    const SizedBox(height: 15),

                    // Bank Name
                    _buildLabel("اسم البنك"),
                    _buildInputWithIcon(
                      hint: "بنك الامارات دبي الوطني",
                      icon: Icons.edit_note,
                    ),

                    const SizedBox(height: 15),

                    // Branch Name
                    _buildLabel("اسم الفرع"),
                    _buildInputWithIcon(
                      hint: "مول الإمارات، دبي",
                      icon: Icons.edit_note,
                    ),

                    const SizedBox(height: 15),

                    // SWFT CODE
                    _buildLabel("SWFT CODE", isEnglish: true),
                    _buildInputWithIcon(hint: "EBILAEAADXXX", icon: null),
                    _buildSubNote(
                      "أدخل رمز سوفيت /بيك البنكي الخاص بك",
                      hasEdit: true,
                    ),

                    const SizedBox(height: 40),

                    // Continue Button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConfirmBankDetailsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1ED794),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "المتابعة",
                            style: cairoBold.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                   
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text, {bool isEnglish = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: cairoBold.copyWith(
          color: Colors.grey[600],
          fontSize: 16,
          fontFamily: isEnglish ? 'Roboto' : null,
        ),
      ),
    );
  }

  Widget _buildSubNote(String text, {bool hasEdit = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: cairoRegular.copyWith(color: Colors.grey[400], fontSize: 11),
          ),
          if (hasEdit) ...[
            const SizedBox(width: 5),
            const Icon(Icons.edit_note, color: Colors.grey, size: 20),
          ],
        ],
      ),
    );
  }

  Widget _buildInputWithIcon({required String hint, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          if (icon != null) Icon(icon, color: Colors.grey[300], size: 24),
          Expanded(
            child: Text(
              hint,
              textAlign: TextAlign.right,
              style: cairoRegular.copyWith(
                color: Colors.grey[300],
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
