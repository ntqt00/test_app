import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_qlcv/domain/usecases/xacthuc_usecase.dart';
import 'package:mobile_qlcv/presentation/main/main_page.dart';
import '../../../common/helpers/app_navigation.dart';
import '../../../data/models/login_model.dart';
import '../../../service_locator.dart';
// import '../../home/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    if (_usernameController.text.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(
        msg: "Vui lòng nhập tên đăng nhập.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
      return;
    }

    if (_passwordController.text.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(
        msg: "Vui lòng nhập mật khẩu.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
      return;
    }

    // Encode the password to Base64
    String encodedPassword =
        base64Encode(utf8.encode(_passwordController.text));

    final loginModel = LoginModel(
      userName: _usernameController.text,
      password: encodedPassword, // Use the Base64 encoded password
    );

    final result = await sl<XacThucUseCase>().call(params: loginModel);

    setState(() {
      _isLoading = false;
    });

    // Handling the result of the login
    result.fold(
      (failure) {
        Fluttertoast.showToast(
          msg: "Đăng nhập thất bại. Tài khoản không hợp lệ.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
        );
      },
      (success) {
        AppNavigator.pushReplacement(context, const MainPage());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'VNPT-TVH-CO',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Username Field
                  _buildTextField(
                    controller: _usernameController,
                    label: 'Tên đăng nhập',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  _buildTextField(
                    controller: _passwordController,
                    label: 'Mật khẩu',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),

                  // Login Button
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: Colors.blue,
                              elevation: 5,
                            ),
                            child: const Text(
                              'Đăng nhập',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
