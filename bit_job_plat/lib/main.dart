import 'package:bit_job_plat/models/data.dart';
import 'package:bit_job_plat/screens/auth_screen.dart';
import 'package:bit_job_plat/screens/home_screen.dart';
import 'package:bit_job_plat/screens/job_details_screen.dart';
import 'package:bit_job_plat/screens/navbar.dart';
import 'package:bit_job_plat/screens/offers_screen.dart';
import 'package:bit_job_plat/screens/onboarding/onbording_screen.dart';
import 'package:bit_job_plat/screens/profile_screen.dart';
import 'package:bit_job_plat/screens/saved_screen.dart';
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
  Get.put(CoreController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bit Job Platform',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnboardingScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/navbar', page: () => const AnimatedBottomBar()),
        GetPage(name: '/offers', page: () => const OffersScreen()),
        GetPage(name: '/saveds', page: () => const SavedScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/auth', page: () => AuthScreen()),
        GetPage(name: '/jobDetails', page: () => const JobDetailsScreen(company: '', job: '', image: ''))
      ],
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}
