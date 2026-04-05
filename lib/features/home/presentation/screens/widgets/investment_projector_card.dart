import 'package:flutter/material.dart';

class InvestmentProjectorCard extends StatelessWidget {
  const InvestmentProjectorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          const Text(
            "كيف يمكن أن تعزز نمو أموالك",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "ما هو المبلغ الذي تريد استثماره مقدماً؟",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRoundButton(Icons.remove),
              const SizedBox(width: 15),
              Container(
                width: 150,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.unfold_more, color: Colors.grey, size: 16),
                    Text(
                      "5.000",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              _buildRoundButton(Icons.add),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: _buildResultCard(
                  "قيمة المحفظة المتوقعة\nعلى مدة 15 سنة",
                  "994.558 ₪",
                  Icons.trending_up,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildResultCard(
                  "الدخل الشهري حسب 15",
                  "3.265 ₪",
                  Icons.account_balance_wallet_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.money, color: Colors.black, size: 20),
                const SizedBox(width: 10),
                const Text(
                  "قيمة محفظتك الاستثمارية الحالية",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                const Text(
                  "3.265 ₪",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Chart custom implementation based on design
          Container(
            height: 240,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10, bottom: 0),
            child: CustomPaint(painter: SimpleChartPainter()),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildDropdown("15 سنين")),
              const SizedBox(width: 15),
              Expanded(child: _buildDropdown("6% صافي العائد")),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "يتضمن هذا الرسم البياني الودائع الشهرية، والأرباح المركبة من إعادة استثمار الإيجار الخاص بك، وزيادة افتراضية بنسبة 30% في التقدير كل 5 سنوات.",
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          const Text(
            "هذه الحاسبة تظهر القيم المستقبلية بناءً على معايير يمكنك تعديلها. الحاسبة مخصصة لأغراض توضيحية ومعلوماتية فقط ولا ينبغي الاعتماد عليها كمؤشر موثوق للأداء المستقبلي.",
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const Divider(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.arrow_back_ios, size: 16),
              const Text(
                "إطلع على الفرص الاستثمارية",
                style: TextStyle(
                  color: Color(0xFF1ED794),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9C4).withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF1ED794), size: 20),
                Spacer(),
                Text(
                  "درجة التنويع",
                  style: TextStyle(
                    color: Color(0xFF1ED794),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.description_outlined, color: Colors.orangeAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Icon(icon, color: Colors.grey, size: 20),
    );
  }

  Widget _buildResultCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(icon, color: const Color(0xFF1ED794), size: 24),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class SimpleChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double topPadding = 40;
    const double bottomPadding = 30;
    const double leftPadding = 50;
    const double rightPadding = 15;

    final w = size.width - leftPadding - rightPadding;
    final h = size.height - topPadding - bottomPadding;

    double x(double val) => leftPadding + w * val;
    double y(double val) => topPadding + h * val;

    // Draw Grid Vertical Lines
    final gridPaint = Paint()
      ..color = Colors.grey.shade200
      ..strokeWidth = 1;

    final xLabels = ['Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan'];
    final xValues = [0.08, 0.24, 0.41, 0.59, 0.75, 0.95];

    for (int i = 0; i < xLabels.length; i++) {
      final dx = x(xValues[i]);
      // Draw vertical line from curve area down to bottom
      canvas.drawLine(Offset(dx, y(0.1)), Offset(dx, y(1.0)), gridPaint);

      // Draw X text
      final textSpan = TextSpan(
        text: xLabels[i],
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(dx - textPainter.width / 2, y(1.0) + 10),
      );
    }

    // Draw Y axis labels
    final yLabels = ['12.000', '11.000', '10.000', '9000', '0', '0'];
    final yValues = [0.10, 0.30, 0.50, 0.70, 0.90, 1.00];

    for (int i = 0; i < yLabels.length; i++) {
      final dy = y(yValues[i]);
      final textSpan = TextSpan(
        text: yLabels[i],
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          leftPadding - textPainter.width - 10,
          dy - textPainter.height / 2,
        ),
      );
    }

    // Draw curve
    final path = Path();
    final points = [
      Offset(x(0.00), y(0.90)), // Yellow dot
      Offset(x(0.04), y(0.75)), // 9000
      Offset(x(0.03), y(0.35)), // 11000 jump backward!
      Offset(x(0.11), y(0.10)), // peak
      Offset(x(0.18), y(0.40)), // valley
      Offset(x(0.24), y(0.30)), // mini peak
      Offset(x(0.32), y(0.10)), // peak
      Offset(x(0.41), y(0.48)), // deep valley at Oct
      Offset(x(0.48), y(0.10)), // peak
      Offset(x(0.54), y(0.15)), // shoulder
      Offset(x(0.59), y(0.30)), // valley
      Offset(x(0.65), y(0.20)), // mini peak
      Offset(x(0.75), y(0.35)), // valley at Dec
      Offset(x(0.85), y(0.05)), // highest peak
      Offset(x(0.95), y(0.28)), // Green dot
    ];

    if (points.isNotEmpty) {
      path.moveTo(points.first.dx, points.first.dy);
      for (int i = 0; i < points.length - 1; i++) {
        final p0 = i > 0 ? points[i - 1] : points[i];
        final p1 = points[i];
        final p2 = points[i + 1];
        final p3 = i != points.length - 2 ? points[i + 2] : p2;

        final cp1 = Offset(
          p1.dx + (p2.dx - p0.dx) / 6,
          p1.dy + (p2.dy - p0.dy) / 6,
        );
        final cp2 = Offset(
          p2.dx - (p3.dx - p1.dx) / 6,
          p2.dy - (p3.dy - p1.dy) / 6,
        );

        path.cubicTo(cp1.dx, cp1.dy, cp2.dx, cp2.dy, p2.dx, p2.dy);
      }
    }

    final linePaint = Paint()
      ..color = const Color(0xFF1ED794)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawPath(path, linePaint);

    // Draw dots
    final yellowPaint = Paint()
      ..color = const Color(0xFFEBC140)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(points.first, 5, yellowPaint);

    final greenPaint = Paint()
      ..color =
          const Color(0xFF0EA775) // Darker green for the end dot
      ..style = PaintingStyle.fill;

    canvas.drawCircle(points.last, 6, greenPaint);

    // Draw specific text "11.989 $"
    const topTextSpan = TextSpan(
      text: "11.989 \$",
      style: TextStyle(
        color: Color(0xFF0EA775),
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );
    final topTextPainter = TextPainter(
      text: topTextSpan,
      textDirection: TextDirection.ltr,
    );
    topTextPainter.layout();
    topTextPainter.paint(
      canvas,
      Offset(x(0.68), y(-0.1) - topTextPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
