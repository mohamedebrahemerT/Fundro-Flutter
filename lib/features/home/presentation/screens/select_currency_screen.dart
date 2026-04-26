import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';

class SelectCurrencyScreen extends StatefulWidget {
  const SelectCurrencyScreen({super.key});

  @override
  State<SelectCurrencyScreen> createState() => _SelectCurrencyScreenState();
}

class _SelectCurrencyScreenState extends State<SelectCurrencyScreen> {
  final List<Map<String, String>> _currencies = [
    {"name": "united arab emiates dirham", "code": "AED (د.إ)"},
    {"name": "afghan afghani", "code": "AED (af)"},
    {"name": "Albanian lek", "code": "ALL (L)"},
    {"name": "Armenian Dram", "code": "AMD (L)"},
    {"name": "Netherlands Antillean Guilder", "code": "ANG (f)"},
    {"name": "Angolan kwanza", "code": "AOA (KZ)"},
    {"name": "Argentine Peso", "code": "ARS (AR\$)"},
    {"name": "Australian Dollar", "code": "AUD (AU\$)"},
    {"name": "Aruban Florin", "code": "AWG (F)"},
    {"name": "Azerbaijani Manat", "code": "AZN (MAH)"},
  ];

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
                    "ابحث عن العملات المتوفرة",
                    style: cairoBold.copyWith(
                      color: const Color(0xFF1ED794),
                      fontSize: 22,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_forward_ios, size: 22, color: Colors.grey),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFFFD144)),
                ),
                child: TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "اختر العملة",
                    hintStyle: cairoRegular.copyWith(color: Colors.grey[300]),
                    border: InputBorder.none,
                    suffixIcon: const Icon(Icons.search, color: Color(0xFF1ED794)),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Currency List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _currencies.length,
                separatorBuilder: (context, index) => Divider(color: Colors.grey.shade100, height: 1),
                itemBuilder: (context, index) {
                  final currency = _currencies[index];
                  return _buildCurrencyRow(currency['name']!, currency['code']!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyRow(String name, String code) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, {"name": name, "code": code});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Code and Symbol (Left)
            Text(
              code,
              style: cairoRegular.copyWith(color: const Color(0xFF2C5E7A), fontSize: 16),
            ),
            // Full Name (Right)
            Text(
              name,
              style: cairoRegular.copyWith(color: const Color(0xFF2C5E7A), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
