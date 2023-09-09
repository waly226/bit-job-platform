import 'package:bit_job_plat/screens/navbar.dart';
import 'package:bit_job_plat/screens/onboarding/onbording_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late User user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? errorMessage;
  Rx<User?> currentUser = Rx<User?>(null);
  RxBool isLoading = RxBool(false);
  RxBool emailVerified = RxBool(false);
  @override
  void onInit() {
    super.onInit();

    _auth.authStateChanges().listen((user) {
      currentUser.value = user;

      if (user != null) {
        emailVerified.value = user.emailVerified;
      }
    });
  }

  Future<void> signUp(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      EasyLoading.showError('Fill out the fields');
      return;
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(email)) {
      EasyLoading.showError('Enter a valid email address');
    } else {
      try {
        EasyLoading.show(status: 'Being registered...');
        //UserCredential userCredential =
        await _auth
            .createUserWithEmailAndPassword(
              email: email,
              password: password,
            )
            .then((uid) => {Get.offAll(() => const AnimatedBottomBar())})
            .catchError((e) {
          return Future.error(e);
        });
      } on FirebaseAuthException catch (error) {
        print(error.code);
      } finally {
        EasyLoading.showSuccess("You've been registered successffly");
      }
    }
  }

  Future<void> signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      EasyLoading.showError('Fill out all the fields');
      return;
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(email)) {
      EasyLoading.showError('Enter a valid email address');
    } else {
      try {
        EasyLoading.show(status: 'Being registered...');
        await _auth
            .signInWithEmailAndPassword(
              email: email,
              password: password,
            )
            .then((uid) => {
                  Get.offAll(() => const AnimatedBottomBar()),
                });
      } on FirebaseAuthException catch (error) {
        print(error.code);
      } finally {
        EasyLoading.showSuccess("You've been connected successffully");
      }
    }
  }
  /*
  Future<void> checkUserRegistration() async {
  try {
    isLoading.value = true;

    if (currentUser.value != null) {
      // User is already logged in, check if their email is verified
      /*if (currentUser.value!.emailVerified) {
        // User is logged in and verified, redirect to home page
        Get.offAll(() => const AnimatedBottomBar());
      } else {
        // User is logged in but not verified, show message and stay on the same page
        EasyLoading.showError("Your email is not verified yet. Please check your inbox and verify your email.");
      }*/
    } else {
      // User is not logged in, redirect to onboarding pages
      Get.offAll(() => OnboardingScreen());
    }
  } catch (e) {
    print(e.toString());
  } finally {
    isLoading.value = false;
  }
}
*/

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar('Erreur', e.toString());
    }
  }

   Future<void> sendEmailVerification() async {
    User? user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      try {
        await user.sendEmailVerification();

        // Show success message
        Get.snackbar('Email Verification Sent',
            'An email verification link has been sent to your email address. Please check your inbox.');

        // Update the user's email verification status
        emailVerified.value = true;
      } catch (e) {
        Get.snackbar('Error', 'Failed to send email verification: $e');
      }
    } else {
      Get.snackbar('Error', 'User is already verified or no user is logged in.');
    }
  }
}
