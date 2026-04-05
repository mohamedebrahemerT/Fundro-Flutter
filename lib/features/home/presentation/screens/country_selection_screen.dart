import 'package:flutter/material.dart';

class CountrySelectionScreen extends StatefulWidget {
  const CountrySelectionScreen({super.key});

  @override
  State<CountrySelectionScreen> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String _searchQuery = '';

  final List<Map<String, String>> _countries = [
    {"name": "أندورا", "code": "+376", "flag": "🇦🇩"},
    {"name": "الإمارات العربية المتحدة", "code": "+971", "flag": "🇦🇪"},
    {"name": "أفغانستان", "code": "+93", "flag": "🇦🇫"},
    {"name": "أنتيغوا وبربودا", "code": "+1268", "flag": "🇦🇬"},
    {"name": "أنجويلا", "code": "+1264", "flag": "🇦🇮"},
    {"name": "ألبانيا", "code": "+355", "flag": "🇦🇱"},
    {"name": "أرمينيا", "code": "+374", "flag": "🇦🇲"},
    {"name": "أنجولا", "code": "+244", "flag": "🇦🇴"},
    {"name": "القارة القطبية الجنوبية", "code": "+0", "flag": "🇦🇶"},
    {"name": "الأرجنتين", "code": "+54", "flag": "🇦🇷"},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCountries = _countries
        .where((country) => country['name']!.contains(_searchQuery))
        .toList();

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
              "احدد البلد",
              style: TextStyle(
                color: Color(0xFF1ED794),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
                size: 20,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                onChanged: (val) => setState(() => _searchQuery = val),
                decoration: InputDecoration(
                  hintText: 'ابحث عن قائمة البلدان',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 13,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF1ED794),
                    size: 20,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFFFD54F)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFFFD54F)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF1ED794)),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
                return GestureDetector(
                  onTap: () {
                    // Return the selected country when tapped
                    Navigator.pop(context, country);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade100),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          country['code']!,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              country['name']!,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              country['flag']!,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
