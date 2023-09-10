import 'dart:async';

import 'package:bit_job_plat/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MailVerificationController extends GetxController {
  static MailVerificationController instance = Get.find();
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerForAutoRedirect();
  }

  Future<void> sendEmailVerification() async {
    try {
      await AuthController.instance.sendEmailVerification();
    } catch (e) {
      Get.snackbar('Error', 'Failed to send email verification: $e');
    }
  }

  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        timer.cancel();
        AuthController.instance.setInitialScreen(user);
      }
    });
  }

  void manuallyCheckEmailVerificationStatus() {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified) {
      AuthController.instance.setInitialScreen(user);
    }
  }
}
