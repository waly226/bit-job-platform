import 'package:bit_job_plat/controllers/chat_controller.dart';
import 'package:bit_job_plat/controllers/companies_controller.dart';
import 'package:bit_job_plat/controllers/email_verification_controller.dart';
import 'package:bit_job_plat/controllers/offers_controller.dart';
import 'package:bit_job_plat/controllers/resume_controller.dart';
import 'package:bit_job_plat/controllers/users-controller.dart';
import 'package:bit_job_plat/models/data.dart';
import 'package:bit_job_plat/screens/chat_screen.dart';
import 'package:bit_job_plat/screens/email_verification_screen.dart';
import 'package:bit_job_plat/screens/home_screen.dart';
import 'package:bit_job_plat/screens/job_details_screen.dart';
import 'package:bit_job_plat/screens/navbar.dart';
import 'package:bit_job_plat/screens/offers_screen.dart';
import 'package:bit_job_plat/screens/profile_screen.dart';
import 'package:bit_job_plat/screens/saved_screen.dart';
import 'package:bit_job_plat/utils/page_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';
import 'firebase_options.dart';
import 'screens/auth_screen.dart';
import 'screens/onboarding/onbording_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //Get.lazyPut(AuthController());
  Get.lazyPut(() => AuthController());
   Get.lazyPut(() => MailVerificationController());
    Get.lazyPut(() => CoreController());
  //Get.put(MailVerificationController());
  //Get.put(CoreController());
  //Get.put(ChatController());
  //Get.put(CompaniesController());
  //Get.put(OffersController());
  //Get.put(ResumesController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       title: 'Bit Job Platform',
        theme: ThemeData(),
       // home: HomePage(),
        initialRoute: '/onboarding',
    
        getPages: [
          GetPage(name: '/onboarding', page: () => const OnboardingScreen()),
          GetPage(name: '/home', page: () => const HomePage()),
          GetPage(name: '/navbar', page: () => const AnimatedBottomBar()),
          GetPage(name: '/offers', page: () => const OffersScreen()),
          GetPage(name: '/saveds', page: () => const SavedScreen()),
          GetPage(name: '/profile', page: () => const ProfileScreen()),
          GetPage(name: '/chat', page: () => const ChatPage()),
          GetPage(
              name: '/mailverification',
              page: () => const MailVerificationScreen()),
          GetPage(name: '/auth', page: () => AuthScreen()),
          GetPage(
              name: '/jobDetails',
              page: () =>
                  const JobDetailsScreen(company: '', job: '', image: ''))
        ],
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init());
  }
}
