import 'dart:async';
import 'dart:math';

import 'package:bit_job_plat/screens/job_details_screen.dart';
import 'package:bit_job_plat/utils/page_routes.dart';
import 'package:bit_job_plat/values/colors.dart';
import 'package:bit_job_plat/values/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../models/data.dart';
import '../values/dimens.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  //final VoidCallback onClose;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController categoryController = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();

  void onSearchPressed() {
    String searchTerm = searchController.text;
    // Effectuer l'action de recherche avec le terme saisi
    // ...
  }

  final AuthController _loadingController = AuthController.instance;

  final List<String> categories = [
    'All Type',
    'Full Time',
    'Part Time',
    'Remote',
    'Freelance',
    'Internship'
  ];
  void dispose() {
    indexcontroller.close();
    //widget.onClose();
    super.dispose();
  }

  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexcontroller = StreamController<int>.broadcast();
  int index = 0;
  bool isBottomSheetVisible = false;
  var jobsList = CoreController.instance.jobsList;
  var companiesList = CoreController.instance.companiesList;
  var companiesLogos = CoreController.instance.companiesLogos;

  late List<String> topCategories;
  late List<String> bottomCategories;
  double value = 0.5;
  RangeValues values = RangeValues(0.3, 0.7);
  @override
  void initState() {
    super.initState();
    topCategories = categories.sublist(0, 3);
    bottomCategories = categories.sublist(3, 6);
  }

  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    print(jobsList);
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<CoreController>(
          init: CoreController.instance,
          builder: (controller) {
            return CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverAppBar(
                  collapsedHeight: 150,
                  automaticallyImplyLeading: false,
                  floating: true,
                  pinned: true,
                  scrolledUnderElevation: 100,
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
                                  'Hi Waliooulahi',
                                  style: normalLargeTextStyle.copyWith(
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Looking for an offer',
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
                                    color: Color.fromARGB(255, 60, 72, 87),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 50,
                                  child: TextField(
                                    style: normalTextStyle.copyWith(
                                        color: Colors.white),
                                    controller: searchController,
                                    decoration: InputDecoration(
                                      hintText: 'What are you looking for...',
                                      hintStyle: hintTextStyle,
                                      hoverColor: Colors.white,
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
                                onPressed: () {
                                  showBottomSheet();
                                },
                                child: Icon(Icons.tune),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 69, 80, 96),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
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
                                            'Job offers',
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
                                        mainAxisSize: MainAxisSize.min,
                                        children: jobsList.map((job) {
                                          int index = jobsList.indexOf(job);
                                          String company = companiesList[index];
                                          var image = companiesLogos[index];
                                          return Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              width: 260,
                                              height: 170,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 3),
                                              child: InkWell(
                                                onTap: () {
                                                  Get.toNamed('/jobDetails',
                                                      arguments: {
                                                        'job': job,
                                                        'company': company,
                                                        'image_path': image,
                                                      });
                                                },
                                                child: Card(
                                                  elevation: 20,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Row(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Image(
                                                                  height: 50,
                                                                  width: 50,
                                                                  image:
                                                                      AssetImage(
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
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    softWrap:
                                                                        true,
                                                                    style:
                                                                        boldTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        spacingControl,
                                                                  ),
                                                                  Text(
                                                                    company,
                                                                    style:
                                                                        normalTextStyle,
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
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 5,
                                                                left: 8),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 7),
                                                              child: Row(
                                                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                // crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            40),
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .info,
                                                                          color:
                                                                              secondaryColor,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          'Job',
                                                                          style:
                                                                              smallBoldTextStyle.copyWith(color: Colors.grey),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .location_on,
                                                                        color:
                                                                            secondaryColor,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      Text(
                                                                        'Munich, Germany',
                                                                        style: smallMediumTextStyle.copyWith(
                                                                            color:
                                                                                Colors.grey),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
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
                                                                            BorderRadius.circular(
                                                                                15),
                                                                        color:
                                                                            secondaryColor),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          bottom:
                                                                              7,
                                                                          top:
                                                                              7,
                                                                          right:
                                                                              10,
                                                                          left:
                                                                              15),
                                                                      child:
                                                                          Text(
                                                                        'Full Time',
                                                                        style: smallMediumTextStyle.copyWith(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  //SizedBox(width: 2,),
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                15),
                                                                        color:
                                                                            secondaryColor),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          bottom:
                                                                              7,
                                                                          top:
                                                                              7,
                                                                          right:
                                                                              10,
                                                                          left:
                                                                              15),
                                                                      child:
                                                                          Text(
                                                                        'Computer Science',
                                                                        style: smallMediumTextStyle.copyWith(
                                                                            color:
                                                                                Colors.white),
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
                                              ));
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
                                          Text('Companies',
                                              style:
                                                  boldLargeTextStyle.copyWith(
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
                              children: companiesList.asMap().entries.map(
                                (entry) {
                                  int index = entry.key;
                                  if (index < 6) return SizedBox();
                                  var company = entry.value;
                                  var image = companiesLogos[index];

                                  return InkWell(
                                    onTap: () {},
                                    child: Stack(
                                      children: [
                                        Container(
                                            /*   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(100),
                                     color: Colors.white,
                                   ),*/
                                            width: 150,
                                            height: 150,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 3),
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
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 10),
                                                              child: Center(
                                                                child: Text(
                                                                  company
                                                                      .toString(),
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  softWrap:
                                                                      true,
                                                                  style:
                                                                      boldTextStyle,
                                                                ),
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
                                                  Center(
                                                    child: Text(
                                                      '5 New offers',
                                                      style:
                                                          smallMediumTextStyle
                                                              .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            )),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 60, top: 120),
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
                                    ),
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
                            Text('Interships Offers',
                                style: boldTextStyle.copyWith(
                                    color: Colors.black)),
                            Text(
                              'View all',
                              style: boldLargeTextStyle.copyWith(
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: jobsList.map(
                          (job) {
                            int index = jobsList.indexOf(job);
                            String company = companiesList[index];
                            var image = companiesLogos[index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed('/jobDetails', arguments: {
                                  'job': job,
                                  'company': company,
                                  'image_path': image,
                                });
                              },
                              child: Container(
                                height: 110,
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
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
                                                            company,
                                                            style: smallMediumTextStyle
                                                                .copyWith(
                                                                    color: Colors
                                                                        .grey),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.bookmark,
                                                  color: secondaryColor,
                                                  size: 30,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 60),
                                                  child: Text(
                                                    'Internship',
                                                    style:
                                                        boldTextStyle.copyWith(
                                                            color:
                                                                secondaryColor),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 95,
                                                ),
                                                Text(
                                                  '2 Months',
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
                      )
                    ],
                  ),
                ]))
              ],
            );
          },
        ),
      ),
    );
  }

  showBottomSheet() {
    setState(() {
      isBottomSheetVisible = true;
    });
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Container(
                height: 750,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Set Filters', style: boldLargeTextStyle),
                    SizedBox(height: 16.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Category', style: boldLargeTextStyle),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextFormField(
                                    autofocus: false,
                                    controller: categoryController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 16.0),
                                        hintText: "Category",
                                        border: InputBorder.none)),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text('Location', style: boldLargeTextStyle),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextFormField(
                                    autofocus: false,
                                    controller: categoryController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 16.0),
                                        hintText: "Location",
                                        border: InputBorder.none)),
                              ),
                            ),
                            SizedBox(height: 16.0),
                          ],
                        ),
                        Text('Offer Type', style: boldLargeTextStyle),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: topCategories.map((category) {
                                int index = topCategories.indexOf(category);
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedCategoryIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                      top: 15,
                                      bottom: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      color: selectedCategoryIndex == index
                                          ? secondaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      category,
                                      style: boldTextStyle.copyWith(
                                        color: selectedCategoryIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: bottomCategories.map((category) {
                                int index =
                                    bottomCategories.indexOf(category) + 3;
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedCategoryIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                      top: 15,
                                      bottom: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      color: selectedCategoryIndex == index
                                          ? secondaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      category,
                                      style: boldTextStyle.copyWith(
                                        color: selectedCategoryIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Salary', style: boldLargeTextStyle),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Min. Salary',
                              style: hintTextStyle,
                            ),
                            Text(
                              'Max. Salary',
                              style: hintTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 2.0, // Hauteur de la piste du slider
                            // trackShape: ,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 20.0),
                          ),
                          child: RangeSlider(
                            activeColor: secondaryColor,
                            inactiveColor: Colors.grey,
                            onChangeStart: (value) {
                              setState(
                                () {
                                  values = value;
                                },
                              );
                            },
                            values: values,
                            onChanged: (newValues) {
                              setState(() {
                                values = newValues;
                              });
                            },
                            labels: RangeLabels(
                                '${values.start.toStringAsFixed(2)}',
                                '${values.end.toStringAsFixed(2)}'),
                            min: 0.0,
                            max: 1.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Job Level',
                        style: boldLargeTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                            Text(
                              'Top Level',
                              style: smallBoldTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            Text(
                              'Mid Level',
                              style: smallBoldTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                            Text(
                              'First Level',
                              style: smallBoldTextStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // Traitement du formulaire
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            'Appy Filter',
                            style: boldLargeTextStyle.copyWith(
                                color: Colors.white),
                          ))),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).then((value) {
      setState(() {
        isBottomSheetVisible = false;
      });
    });
  }
}
