import 'package:bit_job_plat/screens/auth_screen.dart';
import 'package:bit_job_plat/screens/email_verification_screen.dart';
import 'package:bit_job_plat/screens/home_screen.dart';
import 'package:bit_job_plat/screens/job_details_screen.dart';
import 'package:bit_job_plat/screens/navbar.dart';
import 'package:bit_job_plat/screens/offers_screen.dart';
import 'package:bit_job_plat/screens/onboarding/onbording_screen.dart';
import 'package:bit_job_plat/screens/profile_screen.dart';
import 'package:bit_job_plat/screens/saved_screen.dart';
import 'package:get/get.dart';
/*
class RouteHelper {
  static const String onboarding = "/onboarding";
  static const String initial = "/";
  static const String home = "/home";
  static const String navbar = "/navbar";
  static const String offers = "/offers";
  static const String saveds = "/saveds";

  static const String profile = "/profile";
  static const String mailVerification = "/mailverification";
  static const String auth = "/auth";
  static const String jobDetails = "/jobdetails";

  static String getOnboarding() => '$onboarding';
  static String getInitial() => '$initial';
  static String getHome() => '$home';
  static String getNavbar() => '$navbar';
  static String getOffers() => '$offers';
  static String getSaveds() => '$saveds';
  static String getProfile() => '$profile';
  static String getMailVerification() => '$mailVerification';
  static String getAuth() => '$auth';
  static String getJobDetails() => '$jobDetails';

  static List<GetPage> routes = [
    /*GetPage(name: pickAddressMap, page: (){
      PickAddressMap _pickAddress = Get.arguments;
      return _pickAddress;
    }),*/
    // GetPage(name: onboarding, page: () => OnboardingScreen()),
    GetPage(
        name: initial,
        page: () {
          return OnboardingScreen();
        },
        transition: Transition.fade),
    GetPage(
        name: navbar,
        page: () {
          return AnimatedBottomBar();
        },
        transition: Transition.fade),
    GetPage(
        name: jobDetails,
        page: () {
          return JobDetailsScreen(
            company: '',
            job: '',
            image: '',
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: offers,
        page: () {
          return OffersScreen();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: saveds,
        page: () {
          return SavedScreen();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: profile,
        page: () {
          return ProfileScreen();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: mailVerification,
        page: () {
          return MailVerificationScreen();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: auth,
        page: () {
          return AuthScreen();
        },
        transition: Transition.fadeIn)
  ];
}
*/