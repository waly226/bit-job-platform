import 'package:bit_job_plat/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../values/colors.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({super.key});

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

double completenessPercentage = 70.0;
double completenessPercentag = 90.0;
class _ResumeScreenState extends State<ResumeScreen> {
  
  bool resumOpened = true;
  bool resumeOpened = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(500, 200),
        child: Column(
          children: [
            Center(
              child: AppBar(
                centerTitle: true,
                title: Text(
                  'My Resume',
                  style: boldLargeTextStyle.copyWith(color: Colors.white),
                ),
                backgroundColor: primaryColor,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: secondaryColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: 140,
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/IdPhoto.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Walioulahi Rouamba',
                              style: boldLargeTextStyle.copyWith(
                                  color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'rwalioulahi@gmail.com',
                            style: smallBoldTextStyle.copyWith(
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Icon(
                      Icons.upload_file,
                      color: secondaryColor,
                      size: 40,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 320,
                  height: 257,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: primaryColor,
                        width: 12.0,
                      ),
                      bottom: BorderSide(
                        color: primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Column(
                    //   mainAxisAlignment: MainAxisAlignment
                    //     .end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 155),
                        child: Text(
                          'Full Time Resume',
                          style: boldLargeTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.update),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Last Update Date : 2023/06/24',
                            style: hintTextStyle,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                          child: Stack(
                            children: [
                              FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: completenessPercentage / 100.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                    'Profile Completeness: ${completenessPercentage.toStringAsFixed(0)}%',
                                    style: smallBoldTextStyle.copyWith(
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Resume Status',
                              style: boldTextStyle,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Open',
                                  style: boldTextStyle,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        resumeOpened = !resumeOpened;
                                      });
                                    },
                                    child: Icon(
                                      resumeOpened? Icons.toggle_on : Icons.toggle_off,
                                      color: resumeOpened ? primaryColor : Colors.grey,
                                      size: 50,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          //color: primaryColor,
                          // padding: EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8)),
                                    color: primaryColor),
                                height: 40,
                                width: 106,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Update',
                                      style: boldTextStyle.copyWith(
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Container(
                                color: primaryColor,
                                height: 40,
                                width: 105,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Preview',
                                      style: boldTextStyle.copyWith(
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(8)),
                                  color: primaryColor,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.save_alt,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Download',
                                      style: boldTextStyle.copyWith(
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                height: 40,
                                width: 107,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 320,
                  height: 257,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: secondaryColor,
                        width: 12.0,
                      ),
                      bottom: BorderSide(
                        color: secondaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Column(
                    //   mainAxisAlignment: MainAxisAlignment
                    //     .end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 155),
                        child: Text(
                          'Part Time Resume',
                          style: boldLargeTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.update, color: secondaryColor,),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Last Update Date : 2023/04/28',
                            style: hintTextStyle,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                          child: Stack(
                            children: [
                              FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: completenessPercentag / 100.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: secondaryColor,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                    'Profile Completeness: ${completenessPercentag.toStringAsFixed(0)}%',
                                    style: smallBoldTextStyle.copyWith(
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Resume Status',
                              style: boldTextStyle,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Open',
                                  style: boldTextStyle,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        resumOpened = !resumOpened;
                                      });
                                    },
                                    child: Icon(
                                      resumOpened? Icons.toggle_on : Icons.toggle_off,
                                      color: resumOpened ? secondaryColor : Colors.grey,
                                      size: 50,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          //color: primaryColor,
                          // padding: EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8)),
                                    color: secondaryColor),
                                height: 40,
                                width: 106,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Update',
                                      style: boldTextStyle.copyWith(
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Container(
                                color: secondaryColor,
                                height: 40,
                                width: 105,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Preview',
                                      style: boldTextStyle.copyWith(
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(8)),
                                  color: secondaryColor,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.save_alt,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Download',
                                      style: boldTextStyle.copyWith(
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                height: 40,
                                width: 107,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          )
        ],
      ),
    ));
  }
}
