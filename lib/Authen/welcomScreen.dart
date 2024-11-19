import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'component/Background.dart';
import 'createAccount.dart';
import 'enterPass.dart';
class WelcomScreen extends StatelessWidget{
  const WelcomScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Nền chính với hai hình ảnh chồng theo chiều dọc
          Background().defauld,
          // Nội dung chồng lên
          Align(
            alignment: Alignment.centerLeft,
            child:Container(
              margin: EdgeInsets.only( top: 20),
              child: Column(
                children:[
                  Container(
                    width: 512,
                    height: 400,
                    child:
                        Image.asset(
                          "assets/images/logo02.png",

                        ),
                  ),
                  _textContent(),
                  const SizedBox(height: 40),
                  _bottomScreen(context)

                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _textContent(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome to ",
            style: TextStyle(
              fontSize: 40,
              color: Color(0xFF2388F9), // Màu chữ cho "Welcome to"
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'EDUCHAIN', // Đoạn văn bản đầu tiên
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFF379C0B),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' App!', // Đoạn văn bản thứ hai
                  style: TextStyle(
                    fontSize: 40,
                    color: Color(0xFF2388F9), // Màu chữ cho "App"
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10), // Khoảng cách giữa các dòng văn bản
          Text(
            "Explore seamless connections and vibrant interactions on EDC. Experience useful - engaging lessons, enjoy video calling, chatting all in one place!",
            style: TextStyle(
              fontSize: 16, // Cỡ chữ nhỏ hơn cho phần mô tả
              color: Color(0xFFA4A4A4), // Màu #AA4A4A // Đảm bảo chữ nổi bật trên nền tối
            ),
          ),

        ],
      ),
    );
  }
  Widget _bottomScreen(BuildContext context){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:  Column(
        children: [
          ElevatedButton(
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFF124984), // Màu chữ trên button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(51), // Bo góc cho button
              ),
              minimumSize: Size(double.infinity, 50),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Khoảng cách trong nút bấm
            ),
            child: const Text(
              'Log in', // Văn bản trên nút bấm
              style: TextStyle(fontSize: 18), // Kiểu chữ của văn bản
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Xử lý khi nút bấm được nhấn
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateaccountScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent, // Màu chữ trên button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(51), // Bo góc cho button
              ),
              minimumSize: Size(double.infinity, 50),
              elevation: 0,
              padding: EdgeInsets.symmetric( horizontal: 20), // Khoảng cách trong nút bấm
            ),
            child: const Text(
              'Create new account', // Văn bản trên nút bấm
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black), // Kiểu chữ của văn bản
            ),
          ),
        ],
      ),
    );
  }
}