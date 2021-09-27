import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/controllers/login_controllder.dart';
import 'package:taskapp/core/models/login/login_request.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: GetX(
        global: false,
        init: _controller,
        builder: (_) {
          return Stack(
            children: [
              buildUI(),
              Visibility(
                visible: _controller.isLoading.value,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildUI() {
    _userNameController.text = 'hello@api.com';
    _passwordController.text = 'NotSecurePassword';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: _userNameController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter valid email id as hello@api.com'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter password as NotSecurePassword'),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              LoginRequest _request = LoginRequest();
              _request.userName = _userNameController.text;
              _request.password = _passwordController.text;
              _controller.getLoginResponse(_request);
            },
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
