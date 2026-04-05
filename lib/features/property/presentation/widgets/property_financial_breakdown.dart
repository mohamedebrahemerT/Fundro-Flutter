import 'package:flutter/material.dart';

class PropertyFinancialBreakdown extends StatefulWidget {
  const PropertyFinancialBreakdown({super.key});

  @override
  State<PropertyFinancialBreakdown> createState() =>
      _PropertyFinancialBreakdownState();
}

class _PropertyFinancialBreakdownState
    extends State<PropertyFinancialBreakdown> {
  bool _isInvestmentExpanded = true;
  bool _isIncomeExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "التفاصيل المالية",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(width: 12),
              Icon(
                Icons.monetization_on_outlined,
                color: Color(0xFF1ED794),
                size: 28,
              ),
            ],
          ),
        ),

        // Section 1: Investment Value
        _buildBreakdownCard(
          title: "قيمة التواصل", // Communication Value / Total Price
          totalValue: "AED 2.244.236",
          isExpanded: _isInvestmentExpanded,
          icon: Icons.home_work_outlined,
          onToggle: () =>
              setState(() => _isInvestmentExpanded = !_isInvestmentExpanded),
          items: [
            {"label": "سعر العقار", "value": "AED 2.244.236"},
            {"label": "الاستثمار", "value": "AED 2.244.236"},
          ],
          finalLabel: "تكلفة الاستثمار",
          finalValue: "AED 2.244.236",
          footerText: "يشمل رسوم فاندرو بنسبة 1.5%",
        ),

        const SizedBox(height: 15),

        // Section 2: Annual Income
        _buildBreakdownCard(
          title: "الدخل السنوي",
          totalValue: "AED 56.882",
          isExpanded: _isIncomeExpanded,
          icon: Icons.account_balance_wallet_outlined,
          onToggle: () =>
              setState(() => _isIncomeExpanded = !_isIncomeExpanded),
          items: [
            {"label": "الإيجار الإجمالي", "value": "AED 2.244.236"},
            {"label": "رسوم الخدمات", "value": "AED 2.244.236"},
            {"label": "الإدراة الصافي", "value": "AED 2.244.236"},
          ],
          finalLabel: "الدخل الصافي",
          finalValue: "AED 2.244.236",
        ),

        const SizedBox(height: 20),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "هذا تقدير للسنة الأولى من الملكية",
            style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildBreakdownCard({
    required String title,
    required String totalValue,
    required bool isExpanded,
    required IconData icon,
    required VoidCallback onToggle,
    required List<Map<String, String>> items,
    required String finalLabel,
    required String finalValue,
    String? footerText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  totalValue,
                  style: const TextStyle(
                    color: Color(0xFF1ED794),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.info_outline,
                  size: 18,
                  color: Color(0xFF1ED794),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF333333),
                      ),
                    ),
                    GestureDetector(
                      onTap: onToggle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: const Color(0xFF1ED794),
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            isExpanded ? "إخفاء التفاصيل" : "إظهار التفاصيل",
                            style: const TextStyle(
                              color: Color(0xFF1ED794),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F9F3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: const Color(0xFF1ED794), size: 24),
                ),
              ],
            ),
          ),
          if (isExpanded) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Divider(height: 1),
                  const SizedBox(height: 15),
                  ...items.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item["value"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF333333),
                            ),
                          ),
                          Text(
                            item["label"]!,
                            style: const TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          finalValue,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF1ED794),
                          ),
                        ),
                        Text(
                          finalLabel,
                          style: const TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (footerText != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Text(
                footerText,
                style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
