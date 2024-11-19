import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'BirdaySheet.dart';
import 'ForgotPasswordSheet.dart';
import 'chooseNumber.dart';
import 'component/Background.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({Key? key}) : super(key: key);

  @override
  _ResetPassScreenState createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nftController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Thêm các biến để theo dõi các tiêu chí mật khẩu
  bool _hasUpperCase = false;
  bool _hasLowerCase = false;
  bool _passwordsMatch = false;

  @override
  void initState() {
    super.initState();
    // Thêm listeners để kiểm tra mật khẩu trong thời gian thực
    _passwordController.addListener(_validatePasswordCriteria);
    _confirmPasswordController.addListener(_checkPasswordsMatch);
  }
  void _showForgotPasswordSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>  BirthdayPicker(),
    );
  }
  @override
  void dispose() {
    _passwordController.removeListener(_validatePasswordCriteria);
    _confirmPasswordController.removeListener(_checkPasswordsMatch);
    _nftController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validatePasswordCriteria() {
    setState(() {
      final password = _passwordController.text;
      _hasUpperCase = password.contains(RegExp(r'[A-Z]'))
          && password.contains(RegExp(r'[a-z]'))
          &&password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
      _hasLowerCase = password.length >= 8;

    });
  }

  void _checkPasswordsMatch() {
    setState(() {
      _passwordsMatch = _confirmPasswordController.text == _passwordController.text;
    });
  }

  Widget _buildCriteriaRow(bool isMet, String text, String iconPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Image.asset(
            isMet ? "assets/images/icon/icon03.png" : "assets/images/icon/icon04.png"
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: isMet ?  Color(0xFF0AF619) : Colors.black,
              ),
            ),
          ),
        ],
      ),
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
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _topScreen(),
                  const SizedBox(height: 53),
                  _formResetPass(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _formResetPass() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "New password",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 15),
          _buildPasswordField(
            controller: _passwordController,
            hint: '••••••',
            obscureText: _obscurePassword,
            onToggle: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          const SizedBox(height: 15),
          // Hiển thị các tiêu chí mật khẩu
          _buildCriteriaRow(_hasUpperCase, "Both upper & lower-case letter, one symbol, one special character", "assets/images/icon/icon03.png"),
          const SizedBox(height: 15),
          _buildCriteriaRow(_hasLowerCase, "Contains lowercase letter", "assets/images/icon/icon03.png"),

          const SizedBox(height: 15),
          const Text(
            "Confirm password",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          _buildPasswordField(
            controller: _confirmPasswordController,
            hint: '••••••',
            obscureText: _obscureConfirmPassword,
            onToggle: () {
              setState(() {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              });
            },
          ),
          if (_confirmPasswordController.text.isNotEmpty)
            _buildCriteriaRow(_passwordsMatch, "Passwords match", "assets/images/icon/icon03.png"),

          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _isValidPassword() ? () {
              if (_formKey.currentState!.validate()) {
                _showForgotPasswordSheet(context);// Xử lý khi form hợp lệ
              }
            }:(){
              if (_formKey.currentState!.validate()) {
                // Xử lý khi form hợp lệ
              }
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

        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required bool obscureText,
    required VoidCallback onToggle,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFD2D2D2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          onChanged: (value) {
            if (controller == _passwordController) {
              _validatePasswordCriteria();
            } else {
              _checkPasswordsMatch();
            }
          },
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Color(0xFFA4A4A4), // Màu của hintText
              fontSize: 25, // Kích thước font
            ),
            border: InputBorder.none,
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/icon/lock.png"),
                const SizedBox(width: 5),
              ],
            ),
            suffixIcon: IconButton(
              icon: Image.asset("assets/images/icon/icon00.png"),
              // icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: onToggle,
            ),
          ),
        ),
      ),
    );
  }

  bool _isValidPassword() {
    return _hasUpperCase &&
        _hasLowerCase &&
        _confirmPasswordController.text.isNotEmpty;
  }

  Widget _topScreen() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          Image.asset(
            "assets/images/icon/icon01.png",
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 10),
          const Text(
            "Create new password",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}