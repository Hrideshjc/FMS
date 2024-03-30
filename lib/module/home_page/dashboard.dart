import 'package:VMS/module/authentication/login_view/login_page.dart';
import 'package:VMS/module/home_page/fields.dart';
import 'package:VMS/module/home_page/newfields.dart';
import 'package:VMS/utils/constant/images_directory.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      // appBar: AppBar(),

      body: SafeArea(
        
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(ImagesDirectory.dashboardImage))),
          child: Column(
            children: [
              const Padding(
                      padding:  EdgeInsets.only(top:45.0, right: 20),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.notifications, color: Colors.white,size: 40,)
                        ],
                      ),
                    ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                          // InkWell()
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Newfield()));
                              },
                              child: Container(
                                height: 140,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(217, 231, 231, 227),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                  child: Text("Fields"),
                                ),
                              
                              ),
                            ),
                          
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 140,
                              width: 170,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(217, 231, 231, 227),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text("Booking"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const fields()));
                          },
                          child: Container(
                            height: 140,
                            width: 170,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(217, 231, 231, 227),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text("Challenge"),
                            ),
                          ),
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
    );
  }
}
