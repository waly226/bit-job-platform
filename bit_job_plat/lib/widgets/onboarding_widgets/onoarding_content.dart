import 'package:bit_job_plat/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';


class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
      {Key? key,
      required this.title,
      required this.image,
      required this.description})
      : super(key: key);
  final String title, image, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Gap(30),
        Text(title,
            textAlign: TextAlign.center,
            style: boldLargeTextStyle),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: 200,
          width: 200,
        ),
        const Gap(50),
        Text(description,
            textAlign: TextAlign.center,
            style: boldLargeTextStyle),
      ],
    );
  }
}
