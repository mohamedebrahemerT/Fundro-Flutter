import 'package:flutter/material.dart';

class CustomDropdownSelector extends StatefulWidget {
  final String label;
  final String hint;
  final List<String> options;
  final String? selectedValue;
  final Function(String) onChanged;

  const CustomDropdownSelector({
    Key? key,
    required this.label,
    required this.hint,
    required this.options,
    this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropdownSelector> createState() => _CustomDropdownSelectorState();
}

class _CustomDropdownSelectorState extends State<CustomDropdownSelector> {
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _BottomSheetContent(
          title: widget.label,
          options: widget.options,
          onSelected: widget.onChanged,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _showBottomSheet,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  size: 20,
                ),
                Text(
                  widget.selectedValue ?? widget.hint,
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.selectedValue != null
                        ? Colors.black87
                        : Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomSheetContent extends StatefulWidget {
  final String title;
  final List<String> options;
  final Function(String) onSelected;

  const _BottomSheetContent({
    required this.title,
    required this.options,
    required this.onSelected,
  });

  @override
  State<_BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<_BottomSheetContent> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredOptions = widget.options
        .where((opt) => opt.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          // Handle bar
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1ED794),
            ),
          ),
          const SizedBox(height: 16),
          // Search Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                onChanged: (val) => setState(() => _searchQuery = val),
                decoration: InputDecoration(
                  hintText: 'ابحث عن ${widget.title}',
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
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF1ED794)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Options List
          Expanded(
            child: ListView.builder(
              itemCount: filteredOptions.length,
              itemBuilder: (context, index) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    onTap: () {
                      widget.onSelected(filteredOptions[index]);
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.my_location,
                      color: Color(0xFF1ED794),
                      size: 18,
                    ),
                    title: Text(
                      filteredOptions[index],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    shape: Border(
                      bottom: BorderSide(color: Colors.grey.shade100),
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
