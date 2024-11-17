import 'package:flutter/material.dart';

import 'component/Background.dart';

class SplashSreen extends StatelessWidget {
  const SplashSreen({super.key});

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
            child: Padding(padding:EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  Container(
                    width: 321,
                    height: 455,
                    child: Center(
                    child: Image.asset(
                      "assets/images/logo03.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  Text("You have successfully created an account, please enter your account information to start experiencing EDC!",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFA4A4A4A4)
                      ),
                    textAlign: TextAlign.center,
                  ),

                ]
              ),
            ),
          ),
          Positioned(
            bottom: 30,// Dính xuống dưới cùng
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: (){

              }, // Disable nút nếu mật khẩu không hợp lệ
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:  Color(0xFF124984),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(51),
                ),
                minimumSize: const Size(double.infinity, 50),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
