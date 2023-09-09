import 'package:bit_job_plat/screens/auth_screen.dart';
import 'package:bit_job_plat/values/colors.dart';
import 'package:bit_job_plat/values/style.dart';
import 'package:bit_job_plat/widgets/onboarding_widgets/onoarding_content.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../onboardingData/onboarding_data.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({
    super.key,
  });

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final PageController _controller = PageController();
  int currentPage = 0;
  _onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 25, bottom: 25, right: 45),
                  child: currentPage == 2
                      ? Container()
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: secondaryColor),
                          width: size / 5,
                          child: InkWell(
                            onTap: () {
                              _controller.jumpToPage(currentPage + 2);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: Text(
                                    "Skip",
                                    textAlign: TextAlign.center,
                                    style: boldTextStyle.copyWith(color: Colors.white),
                                  ),
                                ),
                                const Icon(
                                  Icons.double_arrow,
                                  size: 16,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                )
              ],
            ),
            Expanded(
              flex: 5,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  onPageChanged: _onChanged,
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) => OnboardingContent(
                        title: onboardingData[index]["title"],
                        image: onboardingData[index]["image"],
                        description: onboardingData[index]["description"],
                      )),
            ),
            const Gap(50),
            currentPage == 2
                ? Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryColor),
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/auth'); 
                          // Navigator.pushNamed(context, '/SignUpWayScreen');
                        },
                        child: Text(
                          "GET STARTED",
                          style: boldLargeTextStyle.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                  )
                : SizedBox(),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                        child: currentPage == 0
                            ? Row(children: <Widget>[
                                const Icon(Icons.arrow_back_ios,
                                    size: 20,
                                    color: Colors.grey),
                                Text("Previous",
                                    style: boldLargeTextStyle.copyWith(color: Colors.grey))
                              ])
                            : InkWell(
                                onTap: () {
                                  _controller.previousPage(
                                      duration:
                                          const Duration(microseconds: 10),
                                      curve: Curves.easeInOutQuint);
                                },
                                child: Row(children: <Widget>[
                                  const Icon(
                                    Icons.arrow_back_ios,
                                    size: 16,
                                    color: secondaryColor,
                                  ),
                                  Text("Previous",
                                      style: boldLargeTextStyle.copyWith(color: secondaryColor))
                                ]),
                              )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    SizedBox(
                      child: currentPage == 2
                          ? Row(
                              children: <Widget>[
                                Text("Next",
                                    style: boldLargeTextStyle.copyWith(color: Colors.grey)),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          : InkWell(
                              onTap: () {
                                _controller.nextPage(
                                    duration: const Duration(microseconds: 800),
                                    curve: Curves.easeInOutQuint);
                              },
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Next",
                                    style: boldLargeTextStyle.copyWith(color: secondaryColor),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                    color: secondaryColor,
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 5),
        height: 10,
        width: currentPage == index ? 10 : 10,
        decoration: BoxDecoration(
            color: currentPage == index
                ? secondaryColor
                : primaryColor,
            borderRadius: BorderRadius.circular(10)));
  }
}
