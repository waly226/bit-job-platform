/*
 * *
 *  * Created by Vishal Patolia on 9/27/21, 6:10 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/27/21, 6:10 PM
 *
 */

import 'dart:io';
import 'package:bit_job_plat/utils/extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/style.dart';

circularImageBorder(double size, String placeHolder, String imageUrl) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(size / 2)),
      border: Border.all(
        color: primaryColor,
        width: borderWidth,
      ),
    ),
    child: ClipOval(
        child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage(placeHolder),
            image: AssetImage(imageUrl))),
  );
}

toolbarBack(String title, BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(150.0),
    child: Row(
      children: [
        InkWell(
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: primaryColor),
            child: Center(
                child: Image.asset(
              "assets/arrow.png",
              height: 24,
              width: 24,
            )),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Text(title,
                style: appBarStyle,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis)
            .addMarginLeft(spacingContainer)
      ],
    ).wrapPaddingAll(spacingContainer),
  );
}

labelTextWidget(String title, double spacingSize) {
  return Text(title, style: normalTextStyle.copyWith(color: Colors.white))
      .wrapPadding(
          padding: EdgeInsets.only(left: spacingSize, top: spacingStandard));
}

launchURL(String url, BuildContext context) async =>
    await canLaunch(url) ? await launch(url) : throw snackBar(context, url);

openWhatsApp(BuildContext context) async {
  var whatsapp = "+918879976594";
  var whatsappURlAndroid = "whatsapp://send?phone=" + whatsapp + "&text=hello";
  var whatAppURL = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
  if (Platform.isIOS || kIsWeb || Platform.isWindows) {
    if (await canLaunch(whatAppURL)) {
      await launch(whatAppURL, forceSafariVC: false);
    } else {
      snackBar(context, "Whatsapp no installed");
    }
  } else {
    if (await canLaunch(whatsappURlAndroid)) {
      await launch(whatsappURlAndroid);
    } else {
      snackBar(context, "Whatsapp no installed");
    }
  }
}

snackBar(BuildContext context, String title) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: primaryColor,
      content:
          Text(title, style: boldTextStyle.copyWith(color: Colors.white))));
}
