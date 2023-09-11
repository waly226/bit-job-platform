import 'dart:io';
import 'package:bit_job_plat/screens/auth_screen.dart';
import 'package:bit_job_plat/screens/email_verification_screen.dart';
import 'package:bit_job_plat/screens/navbar.dart';
import 'package:bit_job_plat/screens/onboarding/onbording_screen.dart';
import 'package:bit_job_plat/utils/page_routes.dart';
import 'package:bit_job_plat/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _firebaseUser;
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  Rx<User?> currentUser = Rx<User?>(null);
  RxBool isLoading = RxBool(false);

  User? get firebaseUser => _firebaseUser.value;
  String get getUserId => firebaseUser?.uid ?? "";
  String get getUserEmail => firebaseUser?.email ?? "";

  @override
  void onInit() {
    super.onInit();
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
   // ever(_firebaseUser, setInitialScreen);
    setInitialScreen(_firebaseUser.value);
  }

  setInitialScreen(User? user) async {

    user == null
        ? Get.toNamed(RouteHelper.initial)
        : user.emailVerified
            ?  Get.offAndToNamed(RouteHelper.navbar)
            : Get.toNamed(RouteHelper.mailVerification);
  }

  void startLoading() {
    isLoading.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }

  Future<void> signUp(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      EasyLoading.showError('Fill out the fields');
      return;
    } else {
      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(email)) {
        EasyLoading.showError('Enter a valid email address');
      } else {
        try {
          isLoading.value = true;
          await _auth
              .createUserWithEmailAndPassword(
                email: email,
                password: password,
              )
              .then((uid) => {setInitialScreen(firebaseUser)});
        } on FirebaseAuthException catch (error) {
          print(error.code);
        } finally {
          EasyLoading.showSuccess("You've been registered successffly");
          isLoading.value = false;
        }
      }
    }
  }

  Future<void> signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      EasyLoading.showError(
        'Fill out all the fields',
      );
      return;
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(email)) {
      EasyLoading.showError('Enter a valid email address');
    } else {
      try {
        startLoading();
        //final auth = AuthController.instance;
        await _auth
            .signInWithEmailAndPassword(
              email: email,
              password: password,
            )
            .then((uid) => {setInitialScreen(firebaseUser)});
        // setInitialScreen(firebaseUser);
      } on FirebaseAuthException catch (error) {
        print(error.code);
      } finally {
        EasyLoading.showSuccess("You've been connected successffully");
        stopLoading();
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.off(() => const OnboardingScreen());
    } catch (e) {
      Get.snackbar('Erreur', 'Failed to logout\n Try again',
          backgroundColor: primaryColor, colorText: editTextBackgroundColor);
    }
  }

  Future<void> sendEmailVerification() async {
    // User? user = _auth.currentUser;
    // if (user != null && !user.emailVerified) {
    try {
      await _auth.currentUser?.sendEmailVerification();
      //await user.sendEmailVerification();

      // Show success message
      Get.snackbar('Email Verification',
          'An email verification link has been sent to your email address. Please check your inbox.',
          backgroundColor: primaryColor, colorText: editTextBackgroundColor);

      // Update the user's email verification status
      //emailVerified.value = true;
    } on FirebaseAuthException catch (e) {
      // final ex = TExceptions.fromCode(e.code);
      Get.snackbar('Error', 'Failed to send email verification: $e',
          backgroundColor: primaryColor, colorText: editTextBackgroundColor);
    } catch (_) {
      //ex = TExceptions()
    }
  }
  /*else {
      Get.snackbar(
          'Error', 'User is already verified or no user is logged in.');
    }
  }*/
}
