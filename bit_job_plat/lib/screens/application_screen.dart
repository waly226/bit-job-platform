import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../values/colors.dart';
import '../values/style.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(500, 50),
        child: Center(
          child: AppBar(
            backgroundColor: Colors.white,
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
            actions: [
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: secondaryColor,
                ),
                onPressed: () {
                  // Action de partage
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text('You have been applied successfuly to Full Stack developer at SAP company',
            style: boldLargeTextStyle.copyWith(color: secondaryColor), textAlign: TextAlign.justify,),
            SizedBox(height: 20,),
            Align(
                alignment: Alignment.topLeft,
                child: Text('Cover Letter', style: boldLargeTextStyle)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                    maxLines: 10,
                    autofocus: false,
                    readOnly: true,
                    initialValue:
                        'mollit esse consectetur cupidatat sint consectetur laborum minim consectetur eu dolore ex Duis proident ea ipsum. voluptate qui lorem cupidatat est adipiscing culpa reprehenderit dolore sunt culpa adipiscing reprehenderit est anim velit do. velit exercitation sed est officia amet est do commodo sed tempor enim in aute officia occaecat.',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 16.0),
                        border: OutlineInputBorder())),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text('Documents', style: boldLargeTextStyle)),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.download_done,
                  color: secondaryColor,
                ),
                title: Text('Resume.pdf'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Applied Date: 15 Sept 2023',
                  style: boldLargeTextStyle.copyWith(color: secondaryColor),
                ))
          ],
        ),
      ),
    ));
  }
}
