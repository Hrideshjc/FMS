import 'package:VMS/controller/fieldcontroller.dart';
import 'package:VMS/module/home_page/newfields.dart';
import 'package:VMS/utils/constant/images_directory.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FutsalDetailPage extends StatelessWidget {
  const FutsalDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutsalDetailPageBuilder(context).build();
  }
}

class FutsalDetailPageBuilder {
  BuildContext context;
  FutsalDetailPageBuilder(this.context);

  Widget build() {
    double? height = MediaQuery.of(context).size.height;
    double? width = MediaQuery.of(context).size.width;
    final homePageController = Get.find<HomePageController>();

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(ImagesDirectory.dashboardImage))),
       
        child: Padding(
          padding: const EdgeInsets.only(top:20.0,right: 20,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Newfield()),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Back",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
              const SizedBox(height: 50),
              Container(
                width: width,

                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(child: Image.network(homePageController.initialImage.toString()),borderRadius: BorderRadius.circular(10),),
                    const SizedBox(height: 20),
                    Text(
                      homePageController.initialName.value,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Text(
                        'Rs. ${homePageController.intialPrice.value.toString()}'),
                    const Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(7, (index) {
                          DateTime dateTime =
                              DateTime.now().add(Duration(days: index));
                          List<String> weekNames = [
                            'Monday',
                            'Tuesday',
                            'Wednesday',
                            'Thursday',
                            'Friday',
                            'Saturday',
                            'Sunday'
                          ];
          
                          List<String> monthNames = [
                            'January',
                            'February',
                            'March',
                            'April',
                            'May',
                            'June',
                            'July',
                            'August',
                            'September',
                            'October',
                            'November',
                            'December'
                          ];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(border: Border.all()),
                              child: Column(
                                children: [
                                  Text(weekNames[dateTime.weekday - 1]),
                                  Text(dateTime.day.toString()),
                                  Text(monthNames[dateTime.month - 1])
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(), color: Colors.blue),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Time"),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Time"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Time"),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Time"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(), color: Colors.blue),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Text(
                                "Book Hourly Rs. ${homePageController.intialPrice.value}/hr"),
                          ),
                        ),
                        const Spacer(),
                      ],
                    )
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
