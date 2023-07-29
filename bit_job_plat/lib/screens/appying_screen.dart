import 'dart:io';

import 'package:bit_job_plat/screens/home_screen.dart';
import 'package:bit_job_plat/values/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../values/colors.dart';
import 'application_screen.dart';

class ApplyingScreen extends StatefulWidget {
  String company;
  ApplyingScreen({super.key, required this.company});

  @override
  State<ApplyingScreen> createState() => _ApplyingScreenState();
}

class _ApplyingScreenState extends State<ApplyingScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController portfolioLinkController =
      new TextEditingController();
  final TextEditingController coverLetterController =
      new TextEditingController();
  String _fileName = '';
  File? _pickedFile;
  List<File> _selectedFiles = [];
  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedFiles.addAll(result.paths.map((path) => File(path!)));
      });
    }
  }

  void _removeFile(int index) {
    setState(() {
      _selectedFiles.removeAt(index);
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 200,
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: secondaryColor,
                  size: 64,
                ),
                SizedBox(height: 20),
                Text('Congratulations !', style: boldLargeTextStyle),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'You have applied for this job successfully',
                  style: hintTextStyle,
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(ApplicationScreen());
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1 / 2,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'View application',
                        style: boldLargeTextStyle.copyWith(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(HomePage());
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1 / 2,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Go to home',
                        style: boldLargeTextStyle.copyWith(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(500, 70),
          child: AppBar(
            title: Text(
              'Apply to ${widget.company}',
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: boldTextStyle,
            ),
          
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
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Contact Details',
                      style: boldTextStyle,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email', style: boldLargeTextStyle),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                autofocus: false,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 16.0),
                                    hintText: "waly@gmil.com",
                                    border: InputBorder.none)),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text('Phone Number', style: boldLargeTextStyle),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                autofocus: false,
                                controller: phoneController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 16.0),
                                    hintText: "76 00 00 00",
                                    border: InputBorder.none)),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text('Portfolio Link', style: boldLargeTextStyle),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                                autofocus: false,
                                controller: portfolioLinkController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 16.0),
                                    hintText: "https://portfolio/",
                                    border: InputBorder.none)),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text('Cover Letter', style: boldLargeTextStyle),
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
                                controller: coverLetterController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 16.0),
                                    hintText: "qui adipiscing elit proident dolor laboris dolore commodo Excepteur anim officia aliqua ipsum proident mollit esse. culpa qui amet velit ex amet nulla culpa eiusmod quis enim sit sunt id consequat esse incididunt. esse velit velit consectetur fugiat commodo sint adipiscing qui cillum ut ut aliqua officia nulla ipsum.",
                                    border: OutlineInputBorder())),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Text('Documents', style: boldLargeTextStyle),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton.icon(
                              onPressed: _openFileExplorer,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    secondaryColor, // Changer la couleur du bouton ici
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Arrondir les bords du bouton ici
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 0),
                              ),
                              icon: Icon(
                                Icons.attach_file,
                                color: Colors.white,
                              ),
                              label: Text('Attach Document',
                                  style: boldLargeTextStyle.copyWith(
                                      color: Colors.white)),
                            ),
                            SizedBox(height: 16.0),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: _selectedFiles.length,
                              itemBuilder: (context, index) {
                                File file = _selectedFiles[index];
                                String fileName = file.path.split('/').last;

                                return Card(
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.download_done,
                                      color: secondaryColor,
                                    ),
                                    title: Text(fileName),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.delete_outline,
                                        color: secondaryColor,
                                      ),
                                      onPressed: () => _removeFile(index),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  _showSuccessDialog();
                                },
                                child: Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 1 / 2,
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    'Submit',
                                    style: boldLargeTextStyle.copyWith(
                                        color: Colors.white),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ),
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
