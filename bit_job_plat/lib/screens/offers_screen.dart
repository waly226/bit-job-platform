import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../models/data.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/style.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var jobsList = CoreController.instance.jobsList;
    var companiesList = CoreController.instance.companiesList;
    var companiesLogos = CoreController.instance.companiesLogos;
    final tabs = <Widget>[
      Tab(
        text: "Applications",
      ),
      Tab(
        text: "Interviews",
      ),
      Tab(
        text: 'Offers',
      )
    ];
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(500, 100),
            child: AppBar(
              title: Text(
                'My offers',
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: boldLargeTextStyle,
              ),
              backgroundColor: Colors.white,
              elevation: 5,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: secondaryColor,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              centerTitle: true,
              bottom: TabBar(
                tabs: tabs,
                labelColor: secondaryColor,
                labelStyle: boldTextStyle,
                indicatorColor: secondaryColor,
                unselectedLabelColor: primaryColor,
              ),
            ),
          ),
          body: TabBarView(children: <Widget>[
            SingleChildScrollView(
              child: Container(
                width: Get.width,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                child: SizedBox(
                  width: Get.width,
                  child: Column(
                    children: jobsList.map(
                      (job) {
                        int index = jobsList.indexOf(job);
                        String company = companiesList[index];
                        return InkWell(
                          onTap: () {
                            /* Get.to(JobDetailsScreen(
                                              job: job,
                                              company: company,
                                            ));*/
                          },
                          child: Container(
                            height: 110,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Image(
                                                      height: 50,
                                                      width: 50,
                                                      image: AssetImage(
                                                          'assets/images/bit.png')),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                SizedBox(
                                                  width: 150,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        job.toString(),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        softWrap: true,
                                                        style: boldTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: spacingControl,
                                                      ),
                                                      Text(
                                                        company,
                                                        style:
                                                            smallMediumTextStyle
                                                                .copyWith(
                                                                    color: Colors
                                                                        .grey),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Color.fromRGBO(
                                                        0, 128, 0, 0.2)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Viewed',
                                                    style:
                                                        boldTextStyle.copyWith(
                                                      color: Color.fromRGBO(
                                                          0, 128, 0, 1.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              /*Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Color.fromRGBO(
                                                        255, 165, 0, 0.2)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Pending',
                                                    style:
                                                        boldTextStyle.copyWith(
                                                      color: Color.fromRGBO(
                                                          255, 165, 0, 1.0),
                                                    ),
                                                  ),
                                                ),
                                              ),*/
                                              /*Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                            
                                                  color:  Color.fromRGBO(255, 0, 0, 0.2)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text('Denied', style: boldTextStyle.copyWith(color: Color.fromRGBO(255, 0, 0, 1.0),),),
                                                ),
                                              ),*/
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 55),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.attach_money_sharp,
                                                    color: secondaryColor,
                                                  ),
                                                  Text(
                                                    '80k',
                                                    style: smallMediumTextStyle
                                                        .copyWith(
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: secondaryColor,
                                                  ),
                                                  Text(
                                                    'Koudougou',
                                                    style: smallMediumTextStyle
                                                        .copyWith(
                                                            color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '2 Hours Ago',
                                              style: boldTextStyle.copyWith(
                                                  color: Colors.grey),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: Get.width,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                child: SizedBox(
                  width: Get.width,
                  child: Column(
                    children: jobsList.map(
                      (job) {
                        int index = jobsList.indexOf(job);
                        String company = companiesList[index];
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            height: 120,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Image(
                                                      height: 50,
                                                      width: 50,
                                                      image: AssetImage(
                                                          'assets/images/bit.png')),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                               /* Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: ClipPath(
                                                      clipper: RectangleTriangleClipper(),
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                ),*/
                                                SizedBox(
                                                  width: 150,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        job.toString(),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        softWrap: true,
                                                        style: boldTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: spacingControl,
                                                      ),
                                                      Text(
                                                        company,
                                                        style:
                                                            smallMediumTextStyle
                                                                .copyWith(
                                                                    color: Colors
                                                                        .grey),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 55, top: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.attach_money_sharp,
                                                    color: secondaryColor,
                                                  ),
                                                  Text(
                                                    '80k',
                                                    style: smallMediumTextStyle
                                                        .copyWith(
                                                            color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: secondaryColor,
                                                  ),
                                                  Text(
                                                    'Koudougou',
                                                    style: smallMediumTextStyle
                                                        .copyWith(
                                                            color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),

                                            /*  Text(
                                              '2 Hours Ago',
                                              style: boldTextStyle.copyWith(
                                                  color: Colors.grey),
                                            )*/
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    height: 150,
                                    width: 120,
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Icon(
                                              Icons.schedule_outlined,
                                              color: secondaryColor,
                                              size: 40,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: secondaryColor),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Text(
                                                  '10 Feb 2022',
                                                  style:
                                                      normalTextStyle.copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                ),
              ),
            )
          ]),
        ));
  }
}
class RectangleTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height); // Déplacer au coin inférieur gauche
    path.lineTo(size.width, size.height); // Dessiner le côté inférieur
    path.lineTo(0, 0); // Dessiner le côté gauche
    path.close(); // Fermer le chemin pour former un triangle rectangle
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}