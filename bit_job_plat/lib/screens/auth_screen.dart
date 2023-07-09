import 'package:bit_job_plat/values/colors.dart';
import 'package:bit_job_plat/values/strings.dart';
import 'package:bit_job_plat/values/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../values/colors.dart';
import '../values/dimens.dart';

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
  final TextEditingController firstNameController = new TextEditingController();
  final TextEditingController secondNameController =
      new TextEditingController();
  final TextEditingController birthDateController = new TextEditingController();
  final TextEditingController studyFieldController =
      new TextEditingController();
  final TextEditingController matriculController = new TextEditingController();
  final TextEditingController classController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();

  bool isChecked = false; // État de la case à cocher
  late int _activeStepIndex = 0;
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
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

  /*List<Step> stepList() => [
    Step(
      state:  _activeStepIndex <= 0 ? StepState.indexed : StepState.complete,
      isActive: _activeStepIndex >= 0,
      title: Text('Etape 1', style: smallMediumTextStyle,),
      content: 
    )
  ]*/


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
              offset: Offset(0, 5), // décalage de l'ombre
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
                prefixIcon: const Icon(Icons.mail, color: prefixIconColor),
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
//hoverColor: secondaryColor,
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
//hoverColor: secondaryColor,
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
    final firstNameField = Padding(
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
            controller: firstNameController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Enter your name please");
              }
              return null;
            },
            onSaved: (value) {
              firstNameController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                hintText: "Rouamba",
                border: InputBorder.none)),
      ),
    );
    final secondNameField = Padding(
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
            controller: secondNameController,
            //  obscureText: true,
            validator: (value) {
              // RegExp regex = new RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Enter your second name please");
              }
              // if (!regex.hasMatch(value)) {
              return null;
              //}
            },
            onSaved: (value) {
              secondNameController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
//hoverColor: secondaryColor,
                focusColor: secondaryColor,
                prefixIcon: const Icon(Icons.person),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                hintText: "Walioulahi",
                border: InputBorder.none)),
      ),
    );
    final birthDateField = Padding(
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
            controller: birthDateController,
            keyboardType: TextInputType.datetime,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Enter your birthdate");
              }
              // reg expression pour validation de l'email
              //if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              //  .hasMatch(value)) {
              //return ("Enter a valid email");
              //  }
              return null;
            },
            onSaved: (value) {
              birthDateController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.date_range),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                hintText: "12/12/2000",
                border: InputBorder.none)),
      ),
    );
    final phoneField = Padding(
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
            controller: phoneController,
            keyboardType: TextInputType.number,
            // obscureText: true,
            validator: (value) {
              //RegExp regex = new RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Enter your phone number please");
              }
              //if (!regex.hasMatch(value)) {
              //return ("Password must be at least 6 characters");
              //}
            },
            onSaved: (value) {
              phoneController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
//hoverColor: secondaryColor,
                focusColor: secondaryColor,
                prefixIcon: const Icon(Icons.phone),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                hintText: "78 00 00 00",
                border: InputBorder.none)),
      ),
    );
    final studyField = Padding(
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
            controller: studyFieldController,
            //obscureText: true,
            validator: (value) {
              // RegExp regex = new RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Choose your study field please");
              }
              // if (!regex.hasMatch(value)) {
              return null;
              //}
            },
            onSaved: (value) {
              studyFieldController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
//hoverColor: secondaryColor,
                focusColor: secondaryColor,
                prefixIcon: const Icon(Icons.school_outlined),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                hintText: "Computer Science",
                border: InputBorder.none)),
      ),
    );
    final matriculField = Padding(
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
            controller: matriculController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Enter your ID please");
              }
              // reg expression pour validation de l'email
              //if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              //  .hasMatch(value)) {
              //return ("Enter a valid email");
              //  }
              return null;
            },
            onSaved: (value) {
              matriculController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                hintText: "bs00000",
                border: InputBorder.none)),
      ),
    );
    final classField = Padding(
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
            controller: classController,
            // obscureText: true,
            validator: (value) {
              //RegExp regex = new RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Enter your class please");
              }
              //if (!regex.hasMatch(value)) {
              //return ("Password must be at least 6 characters");
              //}
            },
            onSaved: (value) {
              phoneController.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
//hoverColor: secondaryColor,
                focusColor: secondaryColor,
                prefixIcon: const Icon(Icons.school),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                hintText: "CS23",
                border: InputBorder.none)),
      ),
    );
    return SafeArea(
     
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
              child: TabBarView(controller: _tabController, children: [
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Checkbox(
                                value: isChecked, // État de la case à cocher
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
                            width: 90,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Container(
                          width: Get.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.9),
                                      //spreadRadius: 2,
                                      blurRadius: 5,
                                      //  offset: Offset(0, 5), // décalage de l'ombre
                                    ),
                                  ],
                                ),
                                child: Image(
                                  width: 50,
                                  height: 50,
                                  image: AssetImage('assets/images/google.jpg'),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.9),
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
                              style:
                                  boldTextStyle.copyWith(color: secondaryColor),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                // Contents of Tab 2

                Stepper(
                    type: StepperType.horizontal,
                    currentStep: _activeStepIndex,
                    steps: <Step>[
                      Step(
                        state: _activeStepIndex <= 0
                            ? StepState.indexed
                            : StepState.complete,
                        isActive: _activeStepIndex >= 0,
                        title: Text(
                          'Etape 1',
                          style: boldTextStyle,
                        ),
                        content: SingleChildScrollView(
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
                                child: firstNameField,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: secondNameField,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Step(
                          state: _activeStepIndex <= 1
                              ? StepState.indexed
                              : StepState.complete,
                          isActive: _activeStepIndex >= 1,
                          title: Text(
                            'Etape 2',
                            style: boldLargeTextStyle,
                          ),
                          content: SingleChildScrollView(
                            child: Column(children: [
                              Center(
                                child: phoneField,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: studyField,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: classField,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: matriculField,
                              ),
                            ]),
                          ))
                    ],
                    onStepTapped: (int index) {
                      setState(() {
                        _activeStepIndex = index;
                      });
                    },
                    // onStepContinue: () {},
                    onStepCancel: () {
                      if (_activeStepIndex == 0) {
                        return;
                      }
                      setState(() {
                        _activeStepIndex -= 1;
                      });
                    },
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      final isLastStep = _activeStepIndex == 1;
                      return Container(
                        // margin: EdgeInsets.all(spacingContainer),
                        child: Padding(
                          padding: const EdgeInsets.all(spacingContainer),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.,
                            children: [
                              if (_activeStepIndex > 0)
                                CupertinoButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  color: secondaryColor,
                                  onPressed: details.onStepCancel,
                                  child: Text(
                                    'Précedent',
                                    style: boldTextStyle.copyWith(
                                        color: Colors.white),
                                  ),
                                ),
                              // const SizedBox(width: spacingContainer,),
                              CupertinoButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                color: secondaryColor,
                                onPressed: () {
                                  if (_activeStepIndex == 0) {
                                    if (signUpEmailController.text.isEmpty ||
                                        signUpPasswordController.text.isEmpty ||
                                        firstNameController.text.isEmpty ||
                                        secondNameController.text.isEmpty) {
                                      EasyLoading.showInfo(
                                          "Fill out all the informations please");
                                    } else {
                                      setState(() {
                                        _activeStepIndex++;
                                      });
                                    }
                                  } else {
                                    if (phoneController.text.isEmpty ||
                                        classController.text.isEmpty ||
                                        matriculController.text.isEmpty ||
                                        studyFieldController.text.isEmpty) {
                                      EasyLoading.showInfo(
                                          "Fill out all the informations please");
                                    } else {}
                                    Get.back();

                                    // });
                                  }
                                },
                                child: (isLastStep)
                                    ? Text(
                                        'Confirmer',
                                        style: boldTextStyle.copyWith(
                                            color: Colors.white),
                                      )
                                    : Text('Suivant',
                                        style: boldTextStyle.copyWith(
                                            color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      );
                    }),

                /* SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: signUpEmailField,
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: signUpPasswordField,
                      ),
                      SizedBox(height: 30,),
                       Center(
                        child: firstNameField,
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: secondNameField,
                      ),
                      SizedBox(height: 30,),
                       Center(
                        child: phoneField,
                      ),
                      SizedBox(height: 30,),
                       Center(
                        child: studyField,
                      ),
                      SizedBox(height: 30,),
                       Center(
                        child: classField,
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: matriculField,
                      ),
                    ],
                  ),
                ),*/
              ]),
            )
          ],
        ),
      ),
    );
  }
}
