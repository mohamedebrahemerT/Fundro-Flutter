import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/home/presentation/screens/confirm_bank_details_screen.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final TextEditingController _amountController = TextEditingController(
    text: '0',
  );
  final List<String> _presets = ['50.000', '10.000', '5.000+', '1.000+'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Custom AppBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 40),
                      Text(
                        "إيداع",
                        style: cairoBold.copyWith(
                          color: const Color(0xFF1ED794),
                          fontSize: 26,
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

                  const SizedBox(height: 60),

                  // Currency Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "﷼",
                        style: cairoBold.copyWith(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.asset(
                          Images.arabic,
                          width: 28,
                          height: 18,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Amount
                  Text(
                    _amountController.text,
                    style: cairoBold.copyWith(
                      fontSize: 70,
                      color: Colors.black,
                      height: 1,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "رصيد حسابك : 0 ﷼",
                    style: cairoRegular.copyWith(
                      // color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Presets
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _presets
                        .map((preset) => _buildPresetChip(preset))
                        .toList(),
                  ),

                  const SizedBox(height: 40),

                  // Add Card Button
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
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFFFE082),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          " أضف بطاقة +",
                          style: cairoBold.copyWith(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
               
               
                ],
              ),
            ),

            const Spacer(),

            // Confirm Button Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC4C4C4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "قم بتأكيد الإيداع",
                        style: cairoBold.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "بمواصلة إيداعك فانك توافق علي شروط الدفع",
                    style: cairoRegular.copyWith(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPresetChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: cairoMedium.copyWith(color: Colors.grey[600], fontSize: 14),
      ),
    );
  }
}
