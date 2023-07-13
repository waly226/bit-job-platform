import 'dart:async';
import 'dart:math';

import 'package:bit_job_plat/values/colors.dart';
import 'package:bit_job_plat/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../values/dimens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  void onSearchPressed() {
    String searchTerm = searchController.text;
    // Effectuer l'action de recherche avec le terme saisi
    // ...
  }
    void dispose() {
    indexcontroller.close();
    super.dispose();
  }
  
  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexcontroller = StreamController<int>.broadcast();
  int index = 0;

  final List<String> recommendedOffers = [
    'Senior UI Designer',
    'Senior DevOps',
    'UI/UX Designer',
    'Backend Developper',
    'FrontEnd Developper',
  ];
  final List<String> recommendedCompanies = [
    'Futurix',
    'Krones',
    'Microsoft',
    'Stern Stewart',
    'Siemens',
  ];
  final List<String> recentlyJobs = [
    'Senior UI Designer',
    'Senior DevOps',
    'UI/UX Designer',
    'Backend Developper',
    'FrontEnd Developper',
    'Senior UI Designer',
    'Senior DevOps',
    'UI/UX Designer',
    'Backend Developper',
    'FrontEnd Developper',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: primaryColor,
       
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              pinned: true,
              scrolledUnderElevation: 50,
              snap: true,
              backgroundColor: primaryColor,
              expandedHeight: 150,
              flexibleSpace: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hi Auguste',
                              style: normalLargeTextStyle.copyWith(
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Find your dream job',
                                style: normalLargeTextStyle.copyWith(
                                    color: Colors.white)),
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF2c5d71),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              child: TextField(
                                controller: searchController,
                                decoration: InputDecoration(
                                  hintText: 'What are you looking for...',
                                  hintStyle: smallNormalTextStyle.copyWith(
                                      color: Colors.grey),
                                  prefixIcon: Icon(Icons.search),
                                  prefixIconColor: Colors.grey,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          ElevatedButton(
                            onPressed: onSearchPressed,
                            child: Icon(Icons.filter_list),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF2c5d71),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.all(12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(children: [
                    /*   Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  color: Colors.white,
              
                ),*/
                    Container(
                        height: MediaQuery.of(context).size.height * 0.42,
                        color: primaryColor,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Recommended for you',
                                        style: boldLargeTextStyle.copyWith(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        'View all',
                                        style: boldLargeTextStyle.copyWith(
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: recommendedOffers.map((offer) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        width: 260,
                                        height: 170,
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 3),
                                        child: Card(
                                          elevation: 20,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
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
                                                            offer,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            softWrap: true,
                                                            style:
                                                                boldTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                spacingControl,
                                                          ),
                                                          Text(
                                                            'Futurix',
                                                            style:
                                                                smallMediumTextStyle,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5, left: 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Row(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 40),
                                                            child: Row(
                                                              children: [
                                                                Icon(Icons
                                                                    .attach_money_sharp),
                                                                Text(
                                                                  '80k',
                                                                  style: smallMediumTextStyle
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.grey),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .location_on),
                                                              Text(
                                                                'Koudougou',
                                                                style: smallMediumTextStyle
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .grey),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                color:
                                                                    secondaryColor),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom: 7,
                                                                      top: 7,
                                                                      right: 10,
                                                                      left: 15),
                                                              child: Text(
                                                                'Full Time',
                                                                style: smallMediumTextStyle
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .white),
                                                              ),
                                                            ),
                                                          ),
                                                          //SizedBox(width: 2,),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                color:
                                                                    secondaryColor),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom: 7,
                                                                      top: 7,
                                                                      right: 10,
                                                                      left: 15),
                                                              child: Text(
                                                                'Experienced 3-5 Yrs',
                                                                style: smallMediumTextStyle
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .white),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Top Companies',
                                          style: boldLargeTextStyle.copyWith(
                                              color: Colors.white)),
                                      Text(
                                        'View all',
                                        style: boldLargeTextStyle.copyWith(
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 280),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: recommendedCompanies.map(
                            (company) {
                              return Stack(
                                children: [
                                  Container(
                                      /*   decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(100),
                                 color: Colors.white,
                               ),*/
                                      width: 130,
                                      height: 130,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3),
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.topCenter,
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
                                                      Center(
                                                        child: Text(
                                                          company,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: true,
                                                          style: boldTextStyle,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Column(
                                              //crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    '12 New offers',
                                                    style: smallMediumTextStyle
                                                        .copyWith(
                                                            color: Colors.grey),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      )),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 50, top: 100),
                                    child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recently Job List',
                            style: boldTextStyle.copyWith(color: Colors.black)),
                        Text(
                          'View all',
                          style:
                              boldLargeTextStyle.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: recentlyJobs.map(
                      (company) {
                        return Container(
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  company,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: true,
                                                  style: boldTextStyle,
                                                ),
                                                SizedBox(
                                                  height: spacingControl,
                                                ),
                                                Text(
                                                  'Futurix',
                                                  style: smallMediumTextStyle
                                                      .copyWith(
                                                          color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ),
                                            ],
                                          ),
                                          
                                         
                                          Icon(Icons.bookmark, color: secondaryColor,size: 30,)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 60),
                                          child: Text('106 Applicants', style: boldTextStyle.copyWith(color: secondaryColor),),
                                        ),
                                        SizedBox(width: 95,),
                                        Text('2 Hours Ago', style: boldTextStyle.copyWith(color: Colors.grey),)
                                      ],)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  )
                ],
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
