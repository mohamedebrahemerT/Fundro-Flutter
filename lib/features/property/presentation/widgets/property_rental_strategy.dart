import 'package:flutter/material.dart';

class PropertyRentalStrategy extends StatelessWidget {
  const PropertyRentalStrategy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "استراتيجية تأجير العقار",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(width: 12),
              Icon(Icons.vpn_key_outlined, size: 24, color: Color(0xFF333333)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFF1ED794).withOpacity(0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "الإيجار طويل الأمد",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.account_balance_outlined,
                    color: Color(0xFF1ED794),
                    size: 24,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "تتمثل استراتيجية التأجير لهذا العقار في توليد عوائد شهرية منتظمة من خلال عقود سنوية مع مستأجرين علي المدي الطويل",
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 14,
                  height: 1.5,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF1ED794)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "سيتم تعيين مدير للعقار",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF333333),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.public, color: Color(0xFF1ED794), size: 22),
                  ],
                ),
              ),
              const Divider(height: 40, color: Color(0xFFEEEEEE)),
              const Text(
                "حالة الملكية",
                style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
              ),
              const SizedBox(height: 4),
              const Text(
                "مؤجر",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "هذا العقار مؤجر وسيبدأ في در الإيجار بمجرد اكتمال عملية النقل",
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 13,
                  height: 1.4,
                ),
                textAlign: TextAlign.right,
              ),
              const Divider(height: 40, color: Color(0xFFEEEEEE)),
              const Text(
                "الإيجار السنوي المتوقع",
                style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
              ),
              const SizedBox(height: 4),
              const Text(
                "AED 146.250",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF1ED794),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "دفعت فاندرو AED50M + للايجار منذ عام 2021",
                    style: TextStyle(color: Color(0xFF1ED794), fontSize: 13),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8F9F3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.attach_money,
                      color: Color(0xFF1ED794),
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFF1ED794).withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: Color(0xFF9E9E9E),
              ),
              const Spacer(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "ميزة ضمان الإيجار من فاندرو",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Text(
                    "الدفعة الأولي بتاريخ 28 فبراير 2026",
                    style: TextStyle(color: Color(0xFF1ED794), fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              const Icon(
                Icons.info_outline,
                color: Color(0xFF1ED794),
                size: 24,
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
