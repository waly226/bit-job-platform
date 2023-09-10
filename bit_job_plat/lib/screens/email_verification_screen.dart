import 'package:bit_job_plat/controllers/auth_controller.dart';
import 'package:bit_job_plat/controllers/email_verification_controller.dart';
import 'package:bit_job_plat/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../values/colors.dart';

class MailVerificationScreen extends StatelessWidget {
  const MailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final controller = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100, right: 30, left: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.mail_outlined,
                size: 200,
                color: secondaryColor,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Verify your Email address.',
                style: boldLargeTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'We have just send email verification link on your email, Please check email and click on that link to verify your Email address.',
                style: normalTextStyle,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'If not auto redirected after verification click on the Continue Button',
                style: normalTextStyle,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
               onTap: () => controller
                    .manuallyCheckEmailVerificationStatus(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: InkWell(
                    child: Container(
                      width: Get.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Continue',
                          style:
                              boldLargeTextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: ()
                  =>
                      controller.sendEmailVerification(),
                  child: Text(
                    'Resend Email link',
                    style: boldTextStyle.copyWith(color: secondaryColor),
                  )),
              TextButton(
                onPressed: () => AuthController.instance.signOut(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: secondaryColor,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Go Back',
                        style: boldTextStyle.copyWith(color: secondaryColor)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
