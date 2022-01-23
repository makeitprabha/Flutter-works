import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/model/user.dart';
import 'package:task/presentation/landing_page.dart';
import 'package:task/presentation/sign_in.dart';
import 'package:task/services/firebase_auth_service.dart';
import 'package:task/services/user_service.dart';

class FirebaseAuthController extends GetxController {
  static FirebaseAuthController get to => Get.find();
  final FirebaseAuthService _authService = FirebaseAuthService();
  final UserService _userService = UserService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();
  final isLoading = false.obs;

  User? get user => _firebaseUser.value;

  User? setUser(User? user) => _firebaseUser.value = user;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
    ever(_firebaseUser, _initScreen);
  }

  _initScreen(User? user) {
    if (_auth.currentUser == null) {
      Get.offAll(
        const SignInPage(),
        transition: Transition.rightToLeft,
      );
    } else {
      Get.offAll(
        const LandingPage(),
        transition: Transition.rightToLeft,
      );
    }
  }

  void _createUser(UserCredential _authResult) async {
    try {
      UserModel user = UserModel(
        id: _authResult.user!.uid,
        email: _authResult.user!.email,
        name: _authResult.user!.email!.split('@')[0],
      );
      await _userService.createNewUser(user);
      setUser(_auth.currentUser);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      Get.snackbar(
        "Error creating Account",
        e.toString(),
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }

  Future<void> register(String email, String password) async {
    try {
      UserCredential _userCredential = await _authService.userRegistration(
        email.trim(),
        password.trim(),
      );
      if (_userCredential.user != null) {
        _createUser(_userCredential);
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar(
        "Error signing in",
        e.toString(),
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential _userCredential = await _authService.userLogin(
        email.trim(),
        password.trim(),
      );
      if (_userCredential.user != null) {
        _createUser(_userCredential);
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar(
        "Error signing in",
        e.toString(),
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }

  Future<void> userSignOut() async {
    try {
      await _authService.userSignOut();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      Get.snackbar(
        "Sign Out Error",
        e.toString(),
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }
}
