import 'package:educhain/Authen/GenderSheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'BirdaySheet.dart';

class AddcontactScreen extends StatefulWidget {
  const AddcontactScreen({super.key});

  @override
  _AddcontactScreenState createState() => _AddcontactScreenState();
}

class _AddcontactScreenState extends State<AddcontactScreen> {
  // Biến để lưu ngày sinh
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _birthdayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Cập nhật giá trị ngày sinh mặc định
    _birthdayController.text = DateFormat('dd-MM-yyyy').format(_selectedDate);
  }

  // Hàm mở BirthdayPicker
  void _selectDate(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,// Cho phép chiều cao tùy chỉnh
      // Loại bỏ nền mặc định
      builder: (_) {
        return Center( // Căn giữa nội dung của BottomSheet
          child: BirthdayPicker(),
        );
      },
    );
  }
  void _selectGender(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true, // Cho phép chiều cao tùy chỉnh
      // Loại bỏ nền mặc định
      builder: (_) {
        return Center( // Căn giữa nội dung của BottomSheet
          child: Gender(),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  _topScreen(),
                  const Divider(
                    color: Color.fromRGBO(166, 166, 166, 0.41),
                    thickness: 1,
                    height: 48,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 83,
                          height: 83,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color.fromRGBO(166, 166, 166, 0.41),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: Image.asset(
                            "assets/images/logo01.png",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Date",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                width: 300,
                                height: 1,
                                color: const Color.fromRGBO(166, 166, 166, 0.41),
                                margin: const EdgeInsets.symmetric(vertical: 4),
                              ),
                              const Text(
                                "Nguyen",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Color(0xFFFAFAFA),
                    child: Column(
                      children: [
                        _buildListTile(
                          title: 'User name',
                          value: 'Dale Nguyen',
                          onTap: () {
                            // Handle user name tap
                          },
                        ),

                        _buildListTile(
                          title: 'Gender',
                          value: 'Male',
                          onTap: () {
                            _selectGender(context);
                          },
                        ),

                        _buildListTile(
                          title: 'Birthday',
                          value: _birthdayController.text, // Hiển thị ngày sinh
                          onTap: () {
                            _selectDate(context); // Mở BirthdayPicker
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget phần trên màn hình
  Widget _topScreen() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Image.asset(
            "assets/images/icon/icon01.png",
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 10),
          const Text(
            "Your information",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // Hành động khi nhấn nút
            },
            child: const Text(
              "Start",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(18, 73, 132, 1),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(51),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }

  // Widget xây dựng một ListTile
  Widget _buildListTile({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              color: Colors.grey[400],
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}