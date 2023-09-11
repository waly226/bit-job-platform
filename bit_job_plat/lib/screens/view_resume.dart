import 'dart:math';

import 'package:bit_job_plat/values/colors.dart';
import 'package:bit_job_plat/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:get/get.dart';
import '../models/resume_data.dart';

class MyResume extends StatefulWidget {
  bool isEditable = true;
  MyResume({super.key, required isEditable});

  @override
  State<MyResume> createState() => _MyResumeState();
}

class _MyResumeState extends State<MyResume> {
  late TemplateTheme theme = TemplateTheme.modern;
  List<TemplateTheme> list = [
    TemplateTheme.none,
    TemplateTheme.classic,
    TemplateTheme.modern,
    TemplateTheme.technical,
    TemplateTheme.business,
  ];

  TemplateTheme getRandomItem() {
    final random = Random();
    final index = random.nextInt(5);
    theme = list[index];
    return list[index];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: InkWell(
            onTap: () {
              setState(() {
                theme = getRandomItem();
              });
            },
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Change modal',
                  style: boldLargeTextStyle.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          body: FlutterResumeTemplate(
           
            data: data,
            templateTheme: theme,
            mode:  widget.isEditable
                ? TemplateMode.shakeEditAndSaveMode
                : TemplateMode.readOnlyMode,
            onSaveResume: (_) async => await PdfHandler().createResume(_),
          ),
        ),
      ),
    );
  }
}
