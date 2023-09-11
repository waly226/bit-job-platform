import 'package:bit_job_plat/controllers/email_verification_controller.dart';
import 'package:bit_job_plat/models/data.dart';
import 'package:bit_job_plat/screens/auth_screen.dart';
import 'package:bit_job_plat/screens/email_verification_screen.dart';
import 'package:bit_job_plat/screens/home_screen.dart';
import 'package:bit_job_plat/screens/job_details_screen.dart';
import 'package:bit_job_plat/screens/navbar.dart';
import 'package:bit_job_plat/screens/offers_screen.dart';
import 'package:bit_job_plat/screens/onboarding/onbording_screen.dart';
import 'package:bit_job_plat/screens/profile_screen.dart';
import 'package:bit_job_plat/screens/saved_screen.dart';
import 'package:bit_job_plat/utils/page_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());
  Get.put(MailVerificationController());
  Get.put(CoreController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Bit Job Platform',
        theme: ThemeData(),
        initialRoute: RouteHelper.initial,
        getPages: RouteHelper.routes,
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init());
  }
}
