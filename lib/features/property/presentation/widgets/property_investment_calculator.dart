import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';

class PropertyInvestmentCalculator extends StatelessWidget {
  const PropertyInvestmentCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "حاسبة الاستثمار",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF1D2126),
                  fontFamily: 'Cairo',
                ),
              ),
              SizedBox(width: 12),
              Image.asset(Images.calculate, width: 24, height: 24),
              // Icon(
              //   Icons.calculate_outlined,
              //   size: 24,
              //   color: Color(0xFF333333),
              // ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4F8EF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.trending_up,
                      color: Color(0xFF00A269),
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "القيمة المتوقعة للاستثمار خلال 5 سنوات",
                        style: TextStyle(
                          color: Color(0xFFACAFB5),
                          fontSize: 14,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE4F8EF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "+39.61%",
                              style: TextStyle(
                                color: Color(0xFF00A269),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "AED 6.981",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFF1D2126),
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              _buildSmallRow("زيادة رأس المال", "AED 225"),
              const SizedBox(height: 8),
              _buildSmallRow("الدخل السنوي", "AED 225"),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          "مبلغ الاستثمار الأولى",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF1D2126),
            fontFamily: 'Cairo',
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            _buildActionBtn(Icons.add),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF00A269)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "5.000",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Text(
                      "AED",
                      style: TextStyle(
                        color: Color(0xFFACAFB5),
                        fontSize: 14,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            _buildActionBtn(Icons.remove),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildSmallRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color(0xFF1D2126),
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFACAFB5),
            fontSize: 14,
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.info_outline, size: 18, color: Color(0xFF00A269)),
      ],
    );
  }

  Widget _buildActionBtn(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF00A269)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.black, size: 24),
    );
  }
}
