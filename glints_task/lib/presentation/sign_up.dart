import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/presentation/sign_in.dart';
import 'package:task/viewmodel/controller/app_controller.dart';
import 'package:task/viewmodel/controller/firebase_auth_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign Up Page"),
      ),
      body: Obx(() {
        return AbsorbPointer(
          absorbing: AppController.to.showProgress.value,
          child: Stack(
            children: [
              _buildUI(context),
              Center(
                child: Visibility(
                  visible: AppController.to.showProgress.value,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                textInputAction: TextInputAction.next,
                controller: _emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                textInputAction: TextInputAction.done,
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  AppController.to.setShowProgress(true);
                  await FirebaseAuthController.to.register(
                    _emailController.text,
                    _passwordController.text,
                  );
                },
                child: const Text(
                  'Sign-Up',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              child: const Text(
                'Go to SignIn directly',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Get.offAll(
                  const SignInPage(),
                  transition: Transition.rightToLeft,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
