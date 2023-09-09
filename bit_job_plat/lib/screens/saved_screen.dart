import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../models/data.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/style.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    var jobsList = CoreController.instance.jobsList;
    var companiesList = CoreController.instance.companiesList;
    var companiesLogos = CoreController.instance.companiesLogos;
    final tabs = <Widget>[
      Tab(
        text: "Jobs",
      ),
      Tab(
        text: "Interships",
      )
    ];
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(500, 100),
            child: AppBar(
              title: Text(
                'Saved Offers',
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
                        var image = companiesLogos[index];
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
                                                          image)),
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
          ]),
        ));
  }
}
