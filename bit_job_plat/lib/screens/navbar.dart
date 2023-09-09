import 'package:bit_job_plat/screens/chat_screen.dart';
import 'package:bit_job_plat/screens/home_screen.dart';
import 'package:bit_job_plat/screens/offers_screen.dart';
import 'package:bit_job_plat/screens/profile_screen.dart';
import 'package:bit_job_plat/screens/saved_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../values/colors.dart';
import 'package:flutter/material.dart';

class AnimatedBottomBar extends StatefulWidget {
  const AnimatedBottomBar({super.key});
  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  int? _currentPage;
  bool isBottomSheetVisible = false;
  //ValueNotifier<bool> isBottomSheetVisible = ValueNotifier<bool>(false);

  @override
  void initState() {
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: getPage(_currentPage),
      bottomNavigationBar: isBottomSheetVisible
          ? SizedBox.shrink()
          : AnimatedBottomNav(
              currentIndex: _currentPage,
              onChange: (index) {
                setState(() {
                  _currentPage = index;
                });
              }),
    );
  }

  getPage(int? page) {
    switch (page) {
      case 0:
        return HomePage();
      case 1:
        return OffersScreen();
      case 2:
        return ChatPage();
      case 3:
        return SavedScreen();
      case 4:
        return ProfileScreen();
    }
  }

  /* void showBottomSheet() {
    setState(() {
      isBottomSheetVisible = true;
    });*/

  /* showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return HomePage(
          onClose: () {
            setState(() {
              isBottomSheetVisible = false;
            });
          },
        );
      },
    );*/
}

class AnimatedBottomNav extends StatelessWidget {
  final int? currentIndex;
  final Function(int)? onChange;
  const AnimatedBottomNav({Key? key, this.currentIndex, this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        margin: EdgeInsets.all(displayWidth * .03),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: primaryColor,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () => onChange!(0),
                child: BottomNavItem(
                  icon: Icons.home,
                  activeColor: secondaryColor,
                  title: "Home",
                  isActive: currentIndex == 0,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => onChange!(1),
                child: BottomNavItem(
                  activeColor: secondaryColor,
                  icon: Icons.home_repair_service,
                  title: "Offers",
                  isActive: currentIndex == 1,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => onChange!(2),
                child: BottomNavItem(
                  activeColor: secondaryColor,
                  icon: Icons.forum,
                  title: "Chat",
                  isActive: currentIndex == 2,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => onChange!(3),
                child: BottomNavItem(
                  activeColor: secondaryColor,
                  icon: Icons.bookmark,
                  title: "Saved",
                  isActive: currentIndex == 3,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => onChange!(4),
                child: BottomNavItem(
                  activeColor: secondaryColor,
                  icon: Icons.person,
                  title: "Profile",
                  isActive: currentIndex == 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final IconData? icon;
  final Color? activeColor;
  final Color? inactiveColor;
  final String? title;
  const BottomNavItem(
      {Key? key,
      this.isActive = false,
      this.icon,
      this.activeColor,
      this.inactiveColor,
      this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 200),
      child: isActive
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: activeColor ?? Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeColor ?? Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            )
          : Icon(
              icon,
              color: inactiveColor ?? primaryColor,
            ),
    );
  }
}
/*
class BottomNavigationPage extends StatefulWidget {
  @override
  BottomNavigationPageState createState() => BottomNavigationPageState();
}

class BottomNavigationPageState extends State<BottomNavigationPage> {
  var currentIndex = 0;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomePage(),
          Text('Offers'),
          Text('Messages'),
          Text('Profile'),
        ],
      ),
      bottomNavigationBar: AnimatedBottNav(

      )
      
      Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: primaryColor,
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: primaryColor,
            highlightColor: primaryColor,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? secondaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex
                                  ? '${listOfStrings[index]}'
                                  : '',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? Colors.white
                                : primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.home_repair_service,
    Icons.comment,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Offers',
    'Messages',
    'Profile',
  ];
}
*/