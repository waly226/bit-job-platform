import 'dart:ui';

import 'package:bit_job_plat/screens/appying_screen.dart';
import 'package:bit_job_plat/values/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:get/get.dart';

import '../models/data.dart';
import '../values/dimens.dart';
import '../values/style.dart';

class JobDetailsScreen extends StatefulWidget {
  final String company;
  final String job;
  const JobDetailsScreen({Key? key, required this.company, required this.job});

  @override
  _JobDatailsScreenState createState() => _JobDatailsScreenState();
}

class _JobDatailsScreenState extends State<JobDetailsScreen> {
  final PageController _pageController = PageController();
  int selectedCategoryIndex = 0;
  bool showAdditionalContainer = false;
  int selectedContainerIndex = 0;
  double scrollOffset = 0.0;
  bool isExpanded = false;
  double _currentPage = 0;
  var companiesList = CoreController.instance.companiesList;
  final int rating = 4;
  final double size = 24.0;

  List<String> imageList = [
    'assets/images/ui.jpg',
    'assets/images/ux.png',
    'assets/images/Visuel.png',
    'assets/images/u.jpg',
  ];

  final List<String> categories = [
    'Description',
    'Company',
    'Reviews',
  ];
  late List<String> skills = ['Adobe xd', 'HTML', 'Css', 'Figma', 'Canvas'];
  late List<String> benefits = [
    'Free lunches',
    'Flexible Schedule',
    'Free Gym',
    'Medical Insurance'
  ];
  late List<String> topSkill;
  late List<String> bottomSkill;

  @override
  void initState() {
    super.initState();
    topSkill = skills.sublist(0, 3);
    bottomSkill = skills.sublist(3, 5);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var job1 = CoreController.instance.jobsList[job];
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
          body: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch
            }),
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification) {
                  setState(() {
                    scrollOffset = notification.metrics.pixels;
                  });
                }
                return false;
              },
              child: SingleChildScrollView(
                // padding: EdgeInsets.only(bottom: 20.0),
                child: Stack(
                  children: [
                    Container(
                      //margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(25)
                          ),
                      // margin: EdgeInsets.all(15.0),
                      // constraints: BoxConstraints(maxWidth: 450),
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          PageView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            controller: _pageController,
                            itemCount: imageList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(imageList[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 30,
                            left: 0,
                            right: 0,
                            child: DotsIndicator(
                              dotsCount: imageList.length,
                              position: _currentPage.toInt(),
                              decorator: DotsDecorator(
                                color: Colors.grey, // Inactive dot color
                                activeColor: secondaryColor, // Active dot color
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(top: 230),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(50)),
                            color: Colors.white),
                        height: 600,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Image(
                                      height: 50,
                                      width: 50,
                                      image:
                                          AssetImage('assets/images/bit.png')),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  // width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${widget.job}',
                                                  //data.recommendedOffers.toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: true,
                                                  style: boldTextStyle,
                                                ),
                                                SizedBox(
                                                  height: spacingControl,
                                                ),
                                                SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    '${widget.company}',
                                                    style: hintTextStyle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Icon(
                                                      Icons.attach_money,
                                                      color: secondaryColor,
                                                    ),
                                                    Text(
                                                      '70K',
                                                      style: hintTextStyle,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      color: secondaryColor,
                                                    ),
                                                    Text(
                                                      'Koudouogu',
                                                      style: hintTextStyle,
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: categories.map((e) {
                                  int index = categories.indexOf(e);
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        showAdditionalContainer =
                                            !showAdditionalContainer;
                                        selectedCategoryIndex = index;
                                        selectedContainerIndex = index;
                                      });
                                    },
                                    child: Container(
                                        height: 49,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.3,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              selectedCategoryIndex == index
                                                  ? BoxShadow(
                                                      color: primaryColor
                                                          .withOpacity(0.9),
                                                      spreadRadius: 3,
                                                      blurRadius: 2,
                                                      offset: Offset(1, 1),
                                                    )
                                                  : BoxShadow(),
                                            ],
                                            color:
                                                selectedCategoryIndex == index
                                                    ? secondaryColor
                                                    : primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Center(
                                            child: Text(
                                          e,
                                          style: smallBoldTextStyle.copyWith(
                                              color: Colors.white),
                                        ))),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Visibility(
                              visible: selectedContainerIndex == 0,
                              child: Container(
                                //margin: EdgeInsets.only(bottom: 20),
                                //color: Colors.red,
                                //width: double.infinity,
                                height: 390,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Job Description',
                                            style: boldLargeTextStyle,
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'commodo consectetur enim ea et in Duis ex esse amet tempor incididunt commodo dolore nisi adipiscing. officia cupidatat occaecat dolor tempor Duis dolore eiusmod lorem occaecat Duis magna id cupidatat velit irure deserunt reprehenderit do. enim dolor fugiat cillum consequat commodo tempor anim ipsum anim dolor elit nulla cillum ea esse non. nulla est sit minim culpa nostrud ad in voluptate nostrud aliquip nostrud minim sint ex veniam voluptate et. est proident in do est tempor ut mollit ad eu occaecat dolore dolore fugiat occaecat in consequat minim.',
                                        textAlign: TextAlign.start,
                                        //overflow: TextOverflow.clip,
                                        softWrap: true,
                                        style: normalTextStyle,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Requirements',
                                            style: boldLargeTextStyle,
                                          )),
                                      Text(
                                        'aliquip consectetur dolore ullamco deserunt ex mollit Excepteur ipsum id eiusmod eu enim ea cillum eu ad aliquip. dolore quis aliqua anim mollit cillum nisi Duis eu fugiat eu cupidatat commodo velit mollit ea ullamco et. enim ullamco magna ea ipsum eu ipsum aute qui cillum occaecat anim minim do lorem commodo. enim ipsum dolor culpa esse in consequat aute sit amet proident Excepteur irure lorem eiusmod veniam.',
                                        style: normalTextStyle,
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Technical Skills',
                                            style: boldLargeTextStyle,
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              for (int index = 0;
                                                  index < skills.length - 2;
                                                  index++)
                                                Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      top: 15,
                                                      bottom: 15,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: secondaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Text(
                                                      skills[index],
                                                      style: boldTextStyle
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              for (int index =
                                                      skills.length - 2;
                                                  index < 5;
                                                  index++)
                                                Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      top: 15,
                                                      bottom: 15,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: secondaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Text(
                                                      skills[index],
                                                      style: boldTextStyle
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    )),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Benefits',
                                          style: boldLargeTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              for (int index = 0;
                                                  index < benefits.length - 2;
                                                  index++)
                                                Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      top: 15,
                                                      bottom: 15,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: secondaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Text(
                                                      benefits[index],
                                                      style: boldTextStyle
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              for (int index =
                                                      skills.length - 2;
                                                  index < 4;
                                                  index++)
                                                Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      top: 15,
                                                      bottom: 15,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: secondaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Text(
                                                      benefits[index],
                                                      style: boldTextStyle
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    )),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Contact',
                                          style: boldLargeTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'assets/images/profile.png'),
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Auguste du bois',
                                                style: boldTextStyle,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Human Ressource',
                                                style: hintTextStyle,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: selectedContainerIndex == 1,
                              child: Container(
                                //color: Colors.red,
                                //width: double.infinity,
                                height: 390,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Overview',
                                          style: boldLargeTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ExpandableText(
                                        "id officia quis quis elit deserunt magna elit exercitation sed adipiscing velit ullamco fugiat voluptate sed qui. laboris consequat amet pariatur non nisi nostrud esse aliquip est commodo fugiat enim exercitation consectetur ut culpa aliquip lorem. sed minim nostrud aliqua sed magna ut magna anim magna ea nulla dolor veniam ut commodo est dolore. voluptate occaecat in dolor reprehenderit et aute culpa et in labore sint enim deserunt reprehenderit enim est. sed velit commodo eiusmod ipsum voluptate irure et lorem aute consequat ullamco consectetur exercitation nulla amet adipiscing consequat. ipsum Duis dolore laborum reprehenderit ea dolore laboris ut mollit consectetur irure reprehenderit id lorem consectetur.dolore velit ad adipiscing ut amet commodo ipsum tempor tempor esse occaecat officia esse pariatur minim amet mollit. in veniam eiusmod occaecat ipsum adipiscing non culpa sint quis aliqua sit sunt nostrud culpa sed et nulla. sed amet et ex magna ut cupidatat do quis dolor nostrud pariatur dolore reprehenderit ut ea do. aliqua ad velit irure Excepteur nulla incididunt ipsum velit qui qui et incididunt sed tempor officia amet laborum officia. Excepteur nisi anim qui aute laborum pariatur quis qui proident ullamco dolore quis sint esse id sit.exercitation fugiat esse anim veniam ipsum non irure occaecat Excepteur occaecat qui est sint veniam dolore veniam. ad aliquip et proident laboris irure dolor officia amet in dolore enim in ex Excepteur lorem nulla. eiusmod sed Duis in mollit elit culpa anim labore qui ullamco pariatur aute aliqua magna cillum ad nulla dolore. aute dolor magna reprehenderit nisi deserunt Excepteur nisi consequat irure tempor ad in elit esse ipsum anim. id elit ipsum lorem sint commodo sunt veniam deserunt eiusmod consequat ea reprehenderit commodo voluptate proident magna. commodo laboris dolor qui commodo aliqua ipsum elit sunt eiusmod sunt occaecat aute ullamco consectetur qui ipsum cillum.amet veniam cillum consectetur ex id ipsum laboris et sunt sed laboris sint non eiusmod adipiscing. aute magna et aliquip fugiat amet non sit laboris exercitation sit qui consectetur proident labore cupidatat officia exercitation. veniam ut fugiat magna incididunt sed enim sed sint labore reprehenderit nisi cillum proident sit tempor. dolore consectetur sint culpa adipiscing magna in do ad nostrud velit mollit fugiat commodo lorem elit mollit fugiat. ea consectetur aute ipsum voluptate et culpa lorem officia nisi ad nulla ea enim officia elit nulla. in in nostrud dolore aute mollit enim reprehenderit eiusmod sint elit elit ullamco non in occaecat quis irure amet.anim occaecat aliqua officia proident irure ipsum dolore do deserunt magna velit aliqua aliquip dolor tempor. ipsum qui aliquip irure do aliquip Excepteur ex cillum sint non lorem eu dolore sit cillum veniam. sed velit in tempor dolor ullamco sunt dolor deserunt esse nostrud eiusmod nulla lorem officia in quis occaecat voluptate. nisi tempor aliquip proident sit officia Duis in fugiat cupidatat Duis do et tempor culpa proident. minim Duis minim eu cillum adipiscing velit anim exercitation nisi nulla qui nulla anim et anim non laborum.",

                                        style: normalTextStyle,
                                        readMoreText: 'Read more..',
                                        readLessText: 'Read less..',
                                        trim: 10,
                                        trimType:
                                            TrimType.lines, // Style du texte
                                        linkTextStyle: hintTextStyle.copyWith(
                                            color: secondaryColor),
                                        onLinkPressed: (expanded) {
                                          setState(() {
                                            isExpanded = expanded;
                                          });
                                        },
                                        textAlign: TextAlign
                                            .justify, // Alignement du texte
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.school,
                                            color: secondaryColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Field',
                                            style: boldLargeTextStyle,
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Computer Science',
                                          style: normalTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.people,
                                            color: secondaryColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Size',
                                            style: boldLargeTextStyle,
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '15 - 30 employees',
                                          style: normalTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.language,
                                            color: secondaryColor,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Website',
                                            style: boldLargeTextStyle,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: RichText(
                                            text: TextSpan(
                                                text: "https://bit.bf/",
                                                style: normalTextStyle,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {})),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: secondaryColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Phone',
                                            style: boldLargeTextStyle,
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '+226 25 45 14 78',
                                          style: normalTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.maps_home_work,
                                            color: secondaryColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Address',
                                            style: boldLargeTextStyle,
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Koudougou, palogo',
                                          style: normalTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      SizedBox(
                                        height: 60,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: selectedContainerIndex == 2,
                              child: Container(
                                //color: Colors.red,
                                //width: double.infinity,
                                //height: MediaQuery.of(context).size.height,
                                height: 390,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Auguste',
                                            style: boldTextStyle,
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'May, 28, 2023',
                                            style: hintTextStyle,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(5, (index) {
                                              return Icon(
                                                index < rating
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                size: size,
                                                color: secondaryColor,
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'laboris exercitation dolore labore nulla incididunt culpa tempor minim ut amet eu voluptate in consequat sint officia laboris. deserunt ullamco nulla aliqua nisi do do sint eu sunt exercitation eiusmod aute mollit ad non ipsum eiusmod. nisi laborum deserunt ea velit sed nostrud mollit eiusmod veniam commodo cillum cupidatat veniam non ex enim aliqua. consequat ipsum aliquip in Duis pariatur nisi adipiscing eu qui sit do eu qui sint non.',
                                        // overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: normalTextStyle,
                                      ),
                                      SizedBox(
                                        height: 45,
                                      ),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Silvere',
                                            style: boldTextStyle,
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'May, 28, 2023',
                                            style: hintTextStyle,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(5, (index) {
                                              return Icon(
                                                index < rating
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                size: size,
                                                color: secondaryColor,
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'laboris exercitation dolore labore nulla incididunt culpa tempor minim ut amet eu voluptate in consequat sint officia laboris. deserunt ullamco nulla aliqua nisi do do sint eu sunt exercitation eiusmod aute mollit ad non ipsum eiusmod. nisi laborum deserunt ea velit sed nostrud mollit eiusmod veniam commodo cillum cupidatat veniam non ex enim aliqua. consequat ipsum aliquip in Duis pariatur nisi adipiscing eu qui sit do eu qui sint non.',
                                        // overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: normalTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            /*for (int index = 0; index < myWidgets.length; index++)
                            Visibility(
                                visible: selectedContainerIndex == index,
                                child: myWidgets[index])*/
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Material(
            elevation: 8,
            color: Color(0xFFFFFFFF),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(ApplyingScreen(company: widget.company,));
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1 / 2,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Apply Now',
                          style:
                              boldLargeTextStyle.copyWith(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1 / 7,
                        height: 50,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.forum,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1 / 7,
                        height: 50,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.bookmark,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
