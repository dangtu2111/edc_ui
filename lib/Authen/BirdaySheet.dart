import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthdayPicker extends StatefulWidget {
  @override
  _BirthdayPickerState createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  final List<String> days = List.generate(31, (index) => (index + 1).toString());
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December'
  ];
  final List<String> years = List.generate(101, (index) => (2023 - index).toString());

  String selectedDay = '15';
  String selectedMonth = 'September';
  String selectedYear = '1997';

  late FixedExtentScrollController dayController;
  late FixedExtentScrollController monthController;
  late FixedExtentScrollController yearController;

  @override
  void initState() {
    super.initState();
    dayController = FixedExtentScrollController(initialItem: days.indexOf(selectedDay));
    monthController = FixedExtentScrollController(initialItem: months.indexOf(selectedMonth));
    yearController = FixedExtentScrollController(initialItem: years.indexOf(selectedYear));
  }

  @override
  void dispose() {
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Center(
                child: Text(
                  'Birthday',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top:0,
                height: 20,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.grey),
                  onPressed: () {
                    Navigator.of(context).pop(); // Đóng picker
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPicker(days, selectedDay, dayController, (value) {
                setState(() {
                  selectedDay = value;
                });
              }),
              _buildPicker(months, selectedMonth, monthController, (value) {
                setState(() {
                  selectedMonth = value;
                });
              }),
              _buildPicker(years, selectedYear, yearController, (value) {
                setState(() {
                  selectedYear = value;
                });
              }),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Logic để lưu hoặc sử dụng ngày đã chọn
              print('Ngày đã chọn: $selectedDay $selectedMonth $selectedYear');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
            child: Center(
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Hàm tạo picker cho ngày, tháng hoặc năm
  Widget _buildPicker(
      List<String> options,
      String selectedValue,
      FixedExtentScrollController controller,
      ValueChanged<String> onSelectedItemChanged,
      ) {
    return Container(
      width: 80, // Đảm bảo mỗi picker có chiều rộng cố định
      height: 150, // Đặt chiều cao của picker để có không gian cuộn
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 40.0, // Điều chỉnh chiều cao mỗi mục trong picker
        physics: FixedExtentScrollPhysics(), // Đảm bảo cuộn dừng ở đúng mục
        onSelectedItemChanged: (index) {
          onSelectedItemChanged(options[index]);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Center(
              child: Text(
                options[index],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black, // Đặt màu tùy chọn
                ),
              ),
            );
          },
          childCount: options.length,
        ),
      ),
    );
  }

}
