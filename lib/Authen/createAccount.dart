import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'component/Background.dart';

class CreateaccountScreen extends StatefulWidget {
  const CreateaccountScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<CreateaccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nftController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  // Các hình ảnh được sử dụng trong Dropdown
  final List<Image> _options = [
    Image.asset("assets/images/icon/vietnam.png"),
    Image.asset("assets/images/icon/vietnam.png"),
    Image.asset("assets/images/icon/vietnam.png"),
  ];
  Image? _selectedOption;

  @override
  void dispose() {
    _nftController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background().defauld,
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _topScreen(),
                  const SizedBox(height: 53),
                  _formLogin(),
                  Text("Create your account to access to all our features and updates.",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFA4A4A4A4)
                      )
                  ),
                  SizedBox(height: 24,),
                  _continueScreen(),

                ],
              ),
            ),
          ),
          // Container dính cuối màn hình
          Positioned(
            bottom: 20,  // Dính xuống dưới cùng
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý khi nút bấm được nhấn
                  print('Button pressed');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0), // Màu chữ trên button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(51), // Bo góc cho button
                  ),
                  minimumSize: Size(double.infinity, 50),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Khoảng cách trong nút bấm
                ),
                child: RichText(
                  text: const TextSpan(
                    text: 'Already have an account? ', // Đoạn văn bản đầu tiên
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFA4A4A4A4),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Log in', // Đoạn văn bản thứ hai
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black, // Màu chữ cho "App"
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _topScreen() {
    return Container(

      margin: EdgeInsets.only(top: 25),
      child: Row(
        children: [
          Image.asset(
            "assets/images/icon/icon01.png",
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 10),
          const Text(
            "Create account",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _formLogin() {
    return Container(

      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "NFT number",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFFD2D2D2),  // Màu của viền
                  width: 1,  // Độ dày của viền
                ),
                borderRadius: BorderRadius.circular(10),  // Tùy chọn bo góc cho viền
              ),
              child: Row(
                children: [
                  // Dropdown
                  Container(
                      width: 80, // Set a width for dropdown
                      height: 52,
                      margin: EdgeInsets.only(left:10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DropdownButtonFormField<Image>(
                        hint: Image.asset(
                          "assets/images/icon/vietnam.png",
                          width: 40,  // Cài đặt chiều rộng cho hình ảnh
                          height: 40, // Cài đặt chiều cao cho hình ảnh
                        ),
                        isDense: true,
                        value: _selectedOption,
                        onChanged: (Image? newValue) {
                          setState(() {
                            _selectedOption = newValue;
                          });
                        },
                        icon: Image.asset(
                            "assets/images/icon/icon02.png"),
                        items: _options.map((Image image) {
                          return DropdownMenuItem<Image>(
                            value: image,
                            child: SizedBox(
                              width: 50,  // Đặt chiều rộng cho hình ảnh trong menu
                              height: 50, // Đặt chiều cao cho hình ảnh trong menu
                              child: image,  // Hiển thị hình ảnh đã chọn
                            ),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),

                      )

                  ),
                  const SizedBox(width: 10),
                  // TextFormField
                  Expanded(
                    child: SizedBox(
                      height: 52, // Ensure TextFormField has the same height
                      child: TextFormField(
                        controller: _nftController,
                        decoration: const InputDecoration(
                          hintText: '1111 1582 2345',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your NFT number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),



            const SizedBox(height: 24),


            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('NFT Number: ${_nftController.text}');
                  print('Password: ${_passwordController.text}');
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF124984), // Màu chữ trên button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(51), // Bo góc cho button
                ),
                minimumSize: Size(double.infinity, 50),
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Khoảng cách trong nút bấm
              ),
              child: const Text(
                'Continue', // Văn bản trên nút bấm
                style: TextStyle(fontSize: 18), // Kiểu chữ của văn bản
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                const Expanded(
                  child: Divider(color: Colors.grey, thickness: 1),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Expanded(
                  child: Divider(color: Colors.grey, thickness: 1),
                ),
              ],
            ),
            const SizedBox(height: 28),

          ],
        ),
      ),
    );
  }
  Widget _continueScreen(){
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('NFT Number: ${_nftController.text}');
                print('Password: ${_passwordController.text}');
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white, // Màu chữ trên button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(51), // Bo góc cho button
              ),
              minimumSize: Size(double.infinity, 50),
              elevation: 0,
              side: BorderSide(color:  Color(0xFFD2D2D2), width: 1),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Khoảng cách trong nút bấm
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/icon/google.png"),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: const Text(
                    'Continue with google', // Văn bản trên nút bấm
                    style: TextStyle(fontSize: 18), // Kiểu chữ của văn bản
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('NFT Number: ${_nftController.text}');
                print('Password: ${_passwordController.text}');
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white, // Màu chữ trên button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(51), // Bo góc cho button
              ),
              minimumSize: Size(double.infinity, 50),
              elevation: 0,
              side: BorderSide(color:  Color(0xFFD2D2D2), width: 1),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Khoảng cách trong nút bấm
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/icon/facebook.png"),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: const Text(
                    'Continue with google', // Văn bản trên nút bấm
                    style: TextStyle(fontSize: 18), // Kiểu chữ của văn bản
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(

            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('NFT Number: ${_nftController.text}');
                print('Password: ${_passwordController.text}');
              }
            },

            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white, // Màu chữ trên button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(51), // Bo góc cho button
              ),
              minimumSize: Size(double.infinity, 50),
              elevation: 0,
              side: BorderSide(color:  Color(0xFFD2D2D2), width: 1),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Khoảng cách trong nút bấm
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/icon/metamask.png"),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: const Text(
                    'Continue with google', // Văn bản trên nút bấm
                    style: TextStyle(fontSize: 18), // Kiểu chữ của văn bản
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
