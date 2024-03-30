import 'package:VMS/module/home_page/home_state.dart';
import 'package:flutter/material.dart';
import 'package:VMS/utils/constant/images_directory.dart';
import 'package:VMS/utils/constant/mediaquary_helper.dart';
import 'package:provider/provider.dart';

class fields extends StatefulWidget {
  const fields({super.key});

  @override
  State<fields> createState() => _fieldsState();
}

class _fieldsState extends State<fields> {
  @override
  void initState() {
    var homeState = Provider.of<HomeState>(context, listen: false);
    homeState.futsalListController(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQueryHelper.screenHeight(context) * 1.2,
          width: MediaQueryHelper.screenWidth(context) * 1.2,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(ImagesDirectory.dashboardImage))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SearchBar(),
                ),
                ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 202, 202, 200),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              ImagesDirectory.appLogo))),
                                ),
                              ),
                              Text("Promotional Futsal"),
                              Text("Rs 1200")
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
