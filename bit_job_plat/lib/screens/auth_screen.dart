import 'package:bit_job_plat/controllers/auth_controller.dart';
import 'package:bit_job_plat/controllers/email_verification_controller.dart';
import 'package:bit_job_plat/screens/home_screen.dart';
import 'package:bit_job_plat/values/colors.dart';
import 'package:bit_job_plat/values/strings.dart';
import 'package:bit_job_plat/values/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import 'navbar.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  final TextEditingController signInEmailController =
      new TextEditingController();
  final TextEditingController signInPasswordController =
      new TextEditingController();
  final TextEditingController signUpEmailController =
      new TextEditingController();
  final TextEditingController signUpPasswordController =
      new TextEditingController();

  final TextEditingController repeatPasswordController =
      new TextEditingController();
  final AuthController _loadingController = AuthController.instance;
  bool isChecked = false; // État de la case à cocher
  late int _activeStepIndex = 0;
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  final AuthController authController = AuthController();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFocused = _focusNode.hasFocus;
    Color prefixIconColor = isFocused ? Colors.red : Colors.blue;
    final signInEmailField = Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: TextFormField(
            focusNode: _focusNode,
            autofocus: false,
            controller: signInEmailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Enter the email address please");
              }
              // reg expression pour validation de l'email
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(value)) {
                return ("Enter a valid email");
              }
              return null;
            },
            onSaved: (value) {
              signInEmailController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                hintText: "Email",
                border: InputBorder.none)),
      ),
    );
    final signInPasswordField = Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 5), // décalage de l'ombre
            ),
          ],
        ),
        child: TextFormField(
            autofocus: false,
            controller: signInPasswordController,
            obscureText: true,
            validator: (value) {
              RegExp regex = new RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Password please");
              }
              if (!regex.hasMatch(value)) {
                return ("Enter a valid password");
              }
            },
            onSaved: (value) {
              signInPasswordController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                focusColor: secondaryColor,
                suffixIcon: Icon(
                  Icons.visibility,
                ),
                prefixIcon: const Icon(Icons.vpn_key),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                hintText: "Password",
                border: InputBorder.none)),
      ),
    );
    final signUpEmailField = Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 5), // décalage de l'ombre
            ),
          ],
        ),
        child: TextFormField(
            autofocus: false,
            controller: signUpEmailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Email please");
              }
              // reg expression pour validation de l'email
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(value)) {
                return ("Enter a valid email");
              }
              return null;
            },
            onSaved: (value) {
              signUpEmailController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                hintText: "Email",
                border: InputBorder.none)),
      ),
    );
    final signUpPasswordField = Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 5), // décalage de l'ombre
            ),
          ],
        ),
        child: TextFormField(
            autofocus: false,
            controller: signUpPasswordController,
            obscureText: true,
            validator: (value) {
              RegExp regex = new RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Password please");
              }
              if (!regex.hasMatch(value)) {
                return ("Password must be at least 6 characters");
              }
            },
            onSaved: (value) {
              signUpPasswordController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                focusColor: secondaryColor,
                suffixIcon: Icon(
                  Icons.visibility,
                ),
                prefixIcon: const Icon(Icons.vpn_key),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                hintText: "Password",
                border: InputBorder.none)),
      ),
    );
    final repeatPasswordField = Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 5), // décalage de l'ombre
            ),
          ],
        ),
        child: TextFormField(
            autofocus: false,
            controller: repeatPasswordController,
            obscureText: true,
            validator: (value) {
              RegExp regex = new RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Repeat Password please");
              }
              if (!regex.hasMatch(value)) {
                return ("Enter a valid password");
              }
            },
            onSaved: (value) {
              signInPasswordController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                focusColor: secondaryColor,
                suffixIcon: Icon(
                  Icons.visibility,
                ),
                prefixIcon: const Icon(Icons.vpn_key),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                hintText: "Repeat Password",
                border: InputBorder.none)),
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Obx(() {
            return _loadingController.isLoading.value
                ? SpinKitThreeInOut(
                    color: secondaryColor,
                    size: 100.0,
                  )
                : Column(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 200,
                          height: 200,
                          child: Image.asset(
                            'assets/images/bit.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      TabBar(
                        dividerColor: Colors.yellow,
                        indicatorColor: secondaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 2.0,
                        //unselectedLabelStyle: ,
                        padding: EdgeInsets.only(bottom: 45),
                        labelColor: Colors.black,
                        labelStyle: boldLargeTextStyle,
                        unselectedLabelColor: Colors.grey,
                        controller: _tabController,
                        tabs: [
                          Tab(
                              child: Text(
                            "Sign In",
                            style: boldLargeTextStyle,
                          )),
                          Tab(
                              child: Text(
                            "Sign Up",
                            style: boldLargeTextStyle,
                          )),
                        ],
                      ),
                      Expanded(
                        child:
                            TabBarView(controller: _tabController, children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Center(
                                  child: signInEmailField,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: signInPasswordField,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Checkbox(
                                          value:
                                              isChecked, // État de la case à cocher
                                          onChanged: (value) {
                                            setState(() {
                                              isChecked =
                                                  value!; // Met à jour l'état de la case à cocher
                                            });
                                          },
                                        ),
                                        Text(
                                          'Remember me',
                                          style: normalTextStyle,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width / 6,
                                    ),
                                    Text(
                                      'Forgot Password',
                                      style: normalTextStyle,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: () {
                                    authController.signIn(
                                        signInEmailController.text,
                                        signInPasswordController.text);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: InkWell(
                                      child: Container(
                                        width: Get.width,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Sign In',
                                            style: boldLargeTextStyle.copyWith(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Social Login',
                                      style: boldTextStyle,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.9),
                                                //spreadRadius: 2,
                                                blurRadius: 5,
                                                //  offset: Offset(0, 5), // décalage de l'ombre
                                              ),
                                            ],
                                          ),
                                          child: Image(
                                            width: 50,
                                            height: 50,
                                            image: AssetImage(
                                                'assets/images/google.jpg'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.9),
                                                //spreadRadius: 2,
                                                blurRadius: 5,
                                                //  offset: Offset(0, 5), // décalage de l'ombre
                                              ),
                                            ],
                                          ),
                                          child: Image(
                                              width: 50,
                                              height: 50,
                                              image: AssetImage(
                                                  'assets/images/facebook.png')),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        'Or',
                                        style: boldTextStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text(
                                        'Continue as Guest',
                                        style: boldTextStyle.copyWith(
                                            color: secondaryColor),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Center(
                                  child: signUpEmailField,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: signUpPasswordField,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: repeatPasswordField,
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (signUpPasswordController.text.isEmpty ||
                                        repeatPasswordController.text.isEmpty) {
                                      EasyLoading.showError(
                                          'Fill out the fields');
                                    } else {
                                      try {
                                        await authController.signUp(
                                            signUpEmailController.text,
                                            signUpPasswordController.text);
                                        await MailVerificationController
                                            .instance
                                            .sendEmailVerification();
                                      } catch (error) {
                                        // Handle error if sign up fails
                                        print(error);
                                        Get.back(); // Close the loading screen
                                        Get.snackbar('Error',
                                            'An error occurred during sign up.');
                                      }
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: Container(
                                      width: Get.width,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: secondaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      )
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
