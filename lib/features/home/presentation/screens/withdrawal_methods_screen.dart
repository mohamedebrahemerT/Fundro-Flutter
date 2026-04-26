import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/features/home/presentation/screens/add_bank_account_screen.dart';

class WithdrawalMethodsScreen extends StatelessWidget {
  const WithdrawalMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 10),
              // Custom AppBar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  Text(
                    "اختر طريقة السحب",
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
              
              const SizedBox(height: 40),
              
              // Banks Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Timing Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF8E1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFFFD144).withOpacity(0.5)),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "أيام 7-3",
                          style: cairoMedium.copyWith(color: const Color(0xFFFFD144), fontSize: 13),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.access_time, color: Color(0xFFFFD144), size: 18),
                      ],
                    ),
                  ),
                  // Title
                  Text(
                    "البنوك",
                    style: cairoBold.copyWith(fontSize: 22, color: Colors.black),
                  ),
                ],
              ),
              
              const SizedBox(height: 10),
              
              // Description
              Text(
                "التحويل المصرفية ليست فورية وسيكون استثمارك معلقا حتي تقي أ موالك",
                textAlign: TextAlign.right,
                style: cairoRegular.copyWith(
                  color: Colors.grey[400],
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              
              const SizedBox(height: 25),
              
              // Add Bank Card Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddBankAccountScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "+ أضيف بطاقة مصرفي",
                      style: cairoBold.copyWith(
                        color: const Color(0xFF2C5E7A),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}
