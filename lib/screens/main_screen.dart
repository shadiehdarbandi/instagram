import 'package:flutter/material.dart';
import 'package:instagram/screens/activit_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/mainpage.dart';
import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/user_profile_screen.dart';

class mainScreen extends StatefulWidget {
  mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int selectedBottomNavigationItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(0xff1C1F2E),
                currentIndex: selectedBottomNavigationItem,
                onTap: (int index) {
                  setState(() {
                    selectedBottomNavigationItem = index;
                  });
                },
                // selectedFontSize: 20,
                // selectedIconTheme: IconThemeData(color: Colors.black),
                selectedItemColor: Color(0xffF35383),
                unselectedItemColor: Colors.white,
                // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                // unselectedItemColor: Colors.amber,
                //showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                      activeIcon: Image.asset('images/icon_active_home.png'),
                      icon: Image.asset('images/icon_home.png'),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      activeIcon: Image.asset(
                          'images/icon_search_navigation_active.png'),
                      icon: Image.asset('images/icon_search_navigation.png'),
                      label: 'Search'),
                  BottomNavigationBarItem(
                    activeIcon:
                        Image.asset('images/icon_add_navigation_active.png'),
                    icon: Image.asset('images/icon_add_navigation.png'),
                    label: 'Add',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Image.asset(
                        'images/icon_activity_navigation_active.png'),
                    icon: Image.asset('images/icon_activity_navigation.png'),
                    label: 'Add',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Container(
                      height: 30,
                      width: 30,
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: FittedBox(
                            child: Image.asset('images/profile.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          width: 2,
                          color: Color(0xffF35383),
                        ),
                      ),
                    ),
                    icon: Container(
                      height: 30,
                      width: 30,
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: FittedBox(
                            child: Image.asset('images/profile.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    label: 'Add',
                  ),
                ]),
          ),
        ),
        body: IndexedStack(
          index: selectedBottomNavigationItem,
          children: getLaout(),
        )
        // getLaout().elementAt(selectedBottomNavigationItem),
        );
  }

  List<Widget> getLaout() {
    return <Widget>[
      homeScreen(),
      searchScreen(),
      main_page(),
      activityScreen(),
      userProfile()
    ];
  }
}
