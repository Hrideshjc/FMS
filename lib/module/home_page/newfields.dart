import 'package:VMS/controller/fieldcontroller.dart';
import 'package:VMS/module/home_page/dashboard.dart';
import 'package:VMS/module/home_page/futsal_detail_page.dart';
import 'package:VMS/module/home_page/home_state.dart';
import 'package:VMS/utils/api_helper/api_urls.dart';
import 'package:VMS/utils/constant/Utilities.dart';
import 'package:VMS/utils/constant/images_directory.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Newfield extends StatefulWidget {
  const Newfield({super.key});

  @override
  State<Newfield> createState() => _NewfieldState();
}

class _NewfieldState extends State<Newfield> {
  @override
  void initState() {
    var homeState = Provider.of<HomeState>(context, listen: false);
    homeState.futsalListController(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 
    
    
    HomePageBuilder(context).build();
  }
}

class HomePageBuilder {
  BuildContext context;
  HomePageBuilder(this.context);

  Widget build() {
    double? height = MediaQuery.of(context).size.height;
    double? width = MediaQuery.of(context).size.width;
    // final homePageController = Get.put(HomePageController());
    return Consumer<HomeState>(
      builder: (context, homePage, _) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              height: height,
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        
              // color: Colors.grey[300],
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(ImagesDirectory.dashboardScroll))),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
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
                    const SizedBox(height: 5),
                    Center(
                      child: Container(
                          width: 0.8 * width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all()),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                border: InputBorder.none),
                            onChanged: (newValue) {
                              // print("this value $newValue");
                              // setState(() {
                              homePage.searchfutsalController(context, newValue); 
                              // homePageController.searchFutsal.value = newValue;
                            },
                          )),
                    ),
                    const SizedBox(height: 5),
                    if (homePage.getFutsal !=null)
                    Expanded(
                      child:  ListView.builder(
                            itemCount: homePage.getFutsal!.data!.length,
                            itemBuilder: (context, index) {
                              var futsal = homePage.getFutsal!.data![index];
                              return InkWell(
                                  onTap: () {
                                // homePageController.initialImage.value = futsal.imagePath;
                                // homePageController.initialName.value = futsal.futsalName!;
                                // homePageController.intialPrice.value = futsal.pricePerHour.toString();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => FutsalDetailPage(selectedfutsal: futsal,)),
                                );
                              },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, right: 20, left: 20),
                                  child: Card(
                                      color: Color(0xffD9D9D9),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            ClipRRect(

                                              child: Image.network(
                                                // UrlManipulator(futsal.fieldImage.toString()).replaceBaseUrl(ApiUrl.mainUrl)
                                                Utilities().removeDynamicPart(futsal.fieldImage.toString())
                                                // height: 150,
                                                // width: double.infinity,
                                                
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            ListTile(
                                              title: Text(
                                               
                                                // UrlManipulator(futsal.fieldImage.toString()).toString(),
                                               futsal.futsalName.toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              subtitle: Text(
                                                  'Rs. ${futsal.pricePerHour.toString()}'),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            },
                          )),
                    
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
