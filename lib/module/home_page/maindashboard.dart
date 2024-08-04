import 'package:VMS/module/home_page/dashboard.dart';
import 'package:VMS/module/home_page/profile.dart';
import 'package:flutter/material.dart';

class MainDashboardPage extends StatefulWidget {
  const MainDashboardPage({Key? key}) : super(key: key);

  @override
  _MainDashboardPageState createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  final List<Widget> _screens = [
    // ToDo: Controller error
    // const MorePage(),
    DashboardView(),
    Profile()
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: _screens[_currentIndex]),
            Positioned(
                bottom: 60,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                         setState(() {
                    _updateIndex(0);
                  });
                      },
                      child: Container(
                        
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xff0068E1),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          children: [
                            
                            Icon(
                              Icons.home,
                              size: 30,
                              color: Colors.white
                            ),
                            if(_currentIndex == 0)
                            Text(
                              "Home",
                              style: TextStyle(fontSize: 15,color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                     InkWell(
                        onTap: (){
                         setState(() {
                    _updateIndex(1);
                  });
                      },
                       child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xff0068E1),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Row(
                          children: [
                            
                            Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.white
                            ),
                            if(_currentIndex == 1)
                            Text(
                              "Profile",
                              style: TextStyle(fontSize: 15,color: Colors.white),
                            ),
                          ],
                        ),
                                         ),
                     )
                  ],
                ))
          ],
        ),
        extendBody: true,
        // bottomNavigationBar: Theme(
        //   data: ThemeData(
        //     splashColor: Colors.transparent,
        //     highlightColor: Colors.transparent,
        //   ),
        //   child: Container(
        //     decoration: const BoxDecoration(boxShadow: [
        //       BoxShadow(blurRadius: 10, color: Colors.grey, offset: Offset(1, 3))
        //     ] // Make rounded corner of border
        //     ),
        //     height: 80,
        //     child: ClipRRect(
        //       borderRadius: const BorderRadius.only(
        //         topRight: Radius.circular(20),
        //         topLeft: Radius.circular(20),
        //       ),
        //       child: BottomNavigationBar(
        //         selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        //         type: BottomNavigationBarType.fixed,
        //         currentIndex: _currentIndex,
        //         onTap: (index) {
        //           if (index == 2) {
        //             return;
        //           }
        //           setState(() {
        //             _updateIndex(index);
        //           });
        //         },
        //         selectedItemColor: Colors.green,
        //         selectedFontSize: 14,
        //         unselectedFontSize: 12,
        //         iconSize: 30,
        //         items: [
        //           BottomNavigationBarItem(
        //             label: "Home",
        //             icon:
        //             Icon(Icons.home),
      
        //             activeIcon: Icon(Icons.home),
        //           ), BottomNavigationBarItem(
        //             label: "Profile",
        //             icon:
        //             Icon(Icons.person),
      
        //             activeIcon: Icon(Icons.person),
        //           ),
      
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
