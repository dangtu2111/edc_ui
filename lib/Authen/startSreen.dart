import 'dart:async';
import 'package:educhain/Authen/welcomScreen.dart';
import 'package:flutter/material.dart';
import 'component/Background.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Hàm tải dữ liệu (mô phỏng việc tải dự án)
  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 3)); // Thời gian tải (3 giây)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomScreen()), // Chuyển sang màn hình chính
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Nền chính với hai hình ảnh chồng theo chiều dọc
          Background().defauld,
          // Nội dung chồng lên
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 186,
              height: 155,
              child: Center(
                child: Image.asset(
                  "assets/images/logo01.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Màn hình chính sau khi tải xong
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}
