// import 'package:VMS/module/home_page/dashboard.dart';
// import 'package:VMS/module/home_page/home_view.dart';
// import 'package:flutter/material.dart';


// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex1 = 0;

//   void _onItemTapped1(int index) {
//     setState(() {
//       _selectedIndex1 = index;
//       if (_selectedIndex1 == 0) {
//         // Navigate to HomePage when 'Home' is tapped
//         Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardView()));
//       } else if (_selectedIndex1 == 1) {
//         // Navigate to BusinessPage when 'Business' is tapped
//         Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePageView()));
//       }
//     });
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: const Center(
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//         ],
//         currentIndex: _selectedIndex1,
//         onTap: _onItemTapped1,
//       ),
//     );
//   }
// }
