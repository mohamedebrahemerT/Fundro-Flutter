import 'package:flutter/material.dart';

/// أنواع الفلاتر المتاحة
enum PropertyFilter { available, funded, sold }

/// صف الفلاتر القابل للتفاعل
class FilterRow extends StatelessWidget {
  final PropertyFilter selectedFilter;
  final ValueChanged<PropertyFilter> onFilterChanged;

  const FilterRow({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final filters = [
      _FilterItem(label: 'المتوفرة 7', filter: PropertyFilter.available),
      _FilterItem(label: 'الممولة (692)', filter: PropertyFilter.funded),
      _FilterItem(label: 'المباعة (23)', filter: PropertyFilter.sold),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: filters.map((item) {
        final isSelected = selectedFilter == item.filter;
        return GestureDetector(
          onTap: () => onFilterChanged(item.filter),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.only(left: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF00A269)
                  : const Color(0xFFEBFEF4),
              borderRadius: BorderRadius.circular(20),
              // boxShadow: isSelected
              //     ? [
              //         BoxShadow(
              //           color: const Color(0xFF00A269),
              //           blurRadius: 8,
              //           offset: const Offset(0, 3),
              //         ),
              //       ]
              //     : [],
            ),
            child: Text(
              item.label,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Cairo',
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : Color(0xFF148F5F),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _FilterItem {
  final String label;
  final PropertyFilter filter;

  const _FilterItem({required this.label, required this.filter});
}
