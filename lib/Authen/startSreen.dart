import 'package:flutter/material.dart';

import 'component/Background.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
