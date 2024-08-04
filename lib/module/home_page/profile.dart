import 'package:VMS/module/authentication/login_view/login_page.dart';
import 'package:VMS/module/profile%20indide/privacy.dart';
import 'package:VMS/module/profile%20indide/tearms.dart';
import 'package:VMS/utils/constant/images_directory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(ImagesDirectory.dashboardImage)),
                // color: Colors.green
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 100.0, right: 40, left: 40, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Hridesh",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Column(
                                  children: [
                                    Items(
                                      title: "Terms & Conditions",
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TermsAndConditionsScreen()));
                                      },
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                      endIndent: 5,
                                      indent: 5,
                                    ),
                                    Items(
                                      title: "Privacy & Policy",
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PrivacyPolicyScreen()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10),
                            child: Text(
                              "LogOut",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(left:200.0, top: 50),
                  //   child: Center(
                  //     child: Row(
                  //       children: [
                  //         GestureDetector(
                  //           onTap: (){},
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 color:Colors.blue
                  //             ),
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(5.0),
                  //               child: Icon(
                  //                   Icons.home
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(width: 50,),
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: GestureDetector(
                  //             onTap: (){},
                  //             child: Container(
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(10),
                  //                   color:Colors.blue
                  //               ),
                  //               child: Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Row(children: [
                  //                   Text("Profile"),
                  //                   Icon(Icons.person_2)
                  //                 ],),
                  //               ),
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          )),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            ElevatedButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("Logout"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                    (route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}

class Items extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;

  Items({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title!), Icon(Icons.arrow_right)],
        ),
      ),
    );
  }
}
