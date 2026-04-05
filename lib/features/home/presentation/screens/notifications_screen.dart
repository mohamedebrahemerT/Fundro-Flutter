import 'package:flutter/material.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/notification_custom_card.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String selectedFilter = 'الكل';
  final List<String> filters = [
    'الكل',
    'نشاط الحساب',
    'تحديثات محفظتك العقارية',
    'قائمة العقارات',
    'التنبيهات',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 40),
            const Text(
              "الإشعارات",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            // Filter Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: filters.map((filter) {
                  final isSelected = selectedFilter == filter;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFE4F9F2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF1ED794)
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFF1ED794)
                              : Colors.grey.shade700,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Layout Content
            Expanded(
              child:
                  selectedFilter == 'نشاط الحساب' ||
                      selectedFilter == 'تحديثات محفظتك العقارية' ||
                      selectedFilter == 'التنبيهات'
                  ? _buildEmptyState()
                  : _buildNotificationsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(Icons.folder_open, size: 80, color: const Color(0xFF1ED794)),
          // const SizedBox(height: 20),
          const Text(
            "كل شيء على مايرام! استرخِ، لن تفوتك فرصة جديدة",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Image.asset('assets/images/empty_notifications.png'),
        ],
      ),
    );
  }

  Widget _buildNotificationsList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (selectedFilter == 'الكل')
          const NotificationCustomCard(
            title: "أكمل التحقق من هويتك",
            subtitle:
                "التحقق من الهوية امنه لأقصى حمل توازن وتعمل عشان تبدأ تكسب دخل مالي",
            iconData: Icons.badge_outlined,
            hasActionBtn: true,
            actionBtnText: "تحقق من جواز السفر",
            date: "NOV 22",
          ),
        const NotificationCustomCard(
          title: "استثمر الآن : لدينا قوائم جديدة منذ آخر مرة سمعت منا",
          subtitle: "استعرض نصف من عوائدك في قسم الدخل العقاري المغلق",
          iconData: Icons.apartment,
          hasImage: true,
          imagePath: 'assets/images/home.png',
          date: "nov 24",
        ),
        const NotificationCustomCard(
          title: "استثمر الآن : لدينا قوائم جديدة منذ آخر مرة سمعت منا",
          subtitle: "استعرض نصف من عوائدك في قسم الدخل العقاري المغلق",
          iconData: Icons.apartment,
          hasImage: true,
          imagePath: 'assets/images/home.png',
          date: "nov 24",
        ),
      ],
    );
  }
}
