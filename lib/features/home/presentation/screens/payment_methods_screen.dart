import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/home/presentation/screens/add_card_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/add_bank_account_screen.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

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
                    "اختر طريقة الدفع",
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
            
            const SizedBox(height: 40),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Cards Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Instant Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE1F5ED),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: const Color(0xFF1ED794)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "فوري ومجاني",
                                style: cairoMedium.copyWith(color: const Color(0xFF1ED794), fontSize: 13),
                              ),
                              const SizedBox(width: 5),
                              const Icon(Icons.info_outline, color: Color(0xFF1ED794), size: 18),
                            ],
                          ),
                        ),
                        // Title
                        Text(
                          "البطاقات",
                          style: cairoBold.copyWith(fontSize: 22, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "حدد بطاقة الائتمان أو الخصم الخاصة بك للدفع",
                      textAlign: TextAlign.right,
                      style: cairoRegular.copyWith(color: Colors.grey[400], fontSize: 13),
                    ),
                    const SizedBox(height: 20),
                    // Add Card Button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCardScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFFFE082), width: 1),
                        ),
                        child: Center(
                          child: Text(
                            "أضف بطاقة +",
                            style: cairoBold.copyWith(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
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
                            borderRadius: BorderRadius.circular(15),
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
                    const SizedBox(height: 5),
                    Text(
                      "التحويل المصرفية ليست فورية وسيكون استثمارك معلقا حتي تقي أ موالك",
                      textAlign: TextAlign.right,
                      style: cairoRegular.copyWith(
                        color: Colors.grey[400],
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
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
                        ),
                        child: Center(
                          child: Text(
                            "+ أضيف بطاقة مصرفي",
                            style: cairoBold.copyWith(
                              color: Colors.grey[400],
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
            
            // Footer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Image.asset(Images.payMethods, height: 45),
                  const SizedBox(height: 10),
                  Text(
                    "تدعم الدفع عن طريق البنك أو فيزت أو ماستر كار",
                    textAlign: TextAlign.center,
                    style: cairoRegular.copyWith(
                      color: Colors.grey[400],
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
}
