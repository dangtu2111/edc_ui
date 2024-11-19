import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseNumberSheet extends StatefulWidget {
  @override
  _ChooseNumberSheetState createState() => _ChooseNumberSheetState();
}

class _ChooseNumberSheetState extends State<ChooseNumberSheet> {
  final List<String> numbers = [
    '1111 1582 2548',
    '1111 1582 2549',
    '1111 1582 2550',
    '1111 1582 2551',
    '1111 1582 2512',
    '1111 1582 2542',
    '1111 1582 252',
    '1111 1582 2152',
  ];

  Map<String, bool> selectedNumbers = {};

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: 1.0,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15),

              // Draggable handle
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 0, 24, bottomPadding + 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),

                        // Header with Cancel, Title and Continue
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF124984),
                                ),
                              ),
                            ),
                            Column(
                              children: const [
                                Text(
                                  'Choose number',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),

                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,

                                  fontSize: 16,
                                  color: Color(0xFF124984),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Search TextField
                        Container(
                          height: 36,

                          // Chiều cao cố định cho search field
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '1111',
                              hintStyle: TextStyle(
                                color: Color(0xFFA4A4A4), // Màu của hintText
                                fontSize: 16, // Kích thước font
                              ),

                              prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
                              suffixIcon: const Icon(Icons.close, color: Colors.grey, size: 20),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Color(0xFFD2D2D2), // Border color when enabled
                                  width: 1.0, // Border width when enabled
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Color(0xFFD2D2D2), // Border color when enabled
                                  width: 1.0, // Border width when enabled
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Color(0xFFD2D2D2), // Border color when enabled
                                  width: 1.0, // Border width when enabled
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 0),
                              isDense: true,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // List of numbers
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListView.separated(

                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: numbers.length,
                            separatorBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
                              child: Divider(
                                height: 1,
                                color: const Color(0xFFA4A4A4), // Divider color
                              ),
                            ),
                            itemBuilder: (context, index) {
                              final number = numbers[index];
                              return Container(
                                height: 48,  // Chiều cao cố định cho mỗi item
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      number,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: const Color(0xFFA4A4A4),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4),
                                            ),

                                          ),
                                        ),
                                        child: Checkbox(
                                          value: selectedNumbers[number] ?? false,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              selectedNumbers[number] = value ?? false;
                                            });
                                          },
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          activeColor: const Color(0xFF124984),
                                          side: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}