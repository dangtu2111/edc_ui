import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'ForgotPasswordSheet.dart';
import 'component/Background.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
  void _showForgotPasswordSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>  ForgotPasswordSheet(),
    );
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
                    _continueScreen(),
                    Container(
                      margin: EdgeInsets.only(top:20),
                      child: ElevatedButton(
                        onPressed: () {
                          // Xử lý khi nút bấm được nhấn
                          print('Button pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white, // Màu chữ trên button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(51), // Bo góc cho button
                          ),
                          minimumSize: Size(double.infinity, 50),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Khoảng cách trong nút bấm
                        ),
                        child:  RichText(
                          text: const TextSpan(
                            text: 'New here', // Đoạn văn bản đầu tiên
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFA4A4A4A4),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Create new account', // Đoạn văn bản thứ hai
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
                  ],
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
            "Login",
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
                          hintStyle: TextStyle(
                            color: Color(0xFFA4A4A4), // Màu của hintText
                            fontSize: 16, // Kích thước font
                          ),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.left, // Căn trái nội dung
                        textAlignVertical: TextAlignVertical.center,
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
            const Text(
              "Password",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left:15,right: 15),
              height: 52,
      
              decoration: BoxDecoration(
                color:Colors.white,
                border: Border.all(
                  color: const Color(0xFFD2D2D2),  // Màu của viền
                  width: 1,  // Độ dày của viền
                ),
                borderRadius: BorderRadius.circular(10),  // Tùy chọn bo góc cho viền
              ),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration:  InputDecoration(
                  hintText: '••••••••', // Ẩn nhãn khi đã nhập
                  border: InputBorder.none,
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      Image.asset("assets/images/icon/lock.png"),  // Ví dụ với icon
                      SizedBox(width: 5),
                    ],
                  ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword; // Đổi trạng thái ẩn/hiện
                        });
                      },
                    ),// Không hiển thị viền trong TextFormField
                ),
                textAlign: TextAlign.left, // Căn trái nội dung
                textAlignVertical: TextAlignVertical.center,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  print("Forgot password clicked");
                },
                child:ElevatedButton(
                  onPressed: (){
                    _showForgotPasswordSheet(context);
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero

                  ),
                ),
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
                'Create new account', // Văn bản trên nút bấm
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
