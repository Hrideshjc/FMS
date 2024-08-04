import 'package:VMS/module/authentication/login_view/login_page.dart';
import 'package:VMS/module/booking/booking_view.dart';
import 'package:VMS/module/home_page/acceptchellenges.dart';
import 'package:VMS/module/home_page/createchallenges.dart';
import 'package:VMS/module/home_page/fields.dart';
import 'package:VMS/module/home_page/home_state.dart';
import 'package:VMS/module/home_page/newfields.dart';
import 'package:VMS/utils/constant/Utilities.dart';
import 'package:VMS/utils/constant/images_directory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListAcceptedChallenge extends StatefulWidget {
  const ListAcceptedChallenge({super.key});

  @override
  State<ListAcceptedChallenge> createState() => _ListAcceptedChallengeState();
}

class _ListAcceptedChallengeState extends State<ListAcceptedChallenge> {
  @override
  void initState() {
    var homeState = Provider.of<HomeState>(context, listen: false);
    homeState.challengeAcceptedController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeState>(builder: (context, homestate, _) {
      return Scaffold(
        // backgroundColor: Colors.blue,
        // appBar: AppBar(),

        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(ImagesDirectory.dashboardImage))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 8),
                child: TextButton.icon(
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
              ),
              const SizedBox(height: 5),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ListView.builder(
                          itemCount: homestate.getchallengeAccepted!.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // homePageController.initialImage.value = futsal.imagePath;
                                // homePageController.initialName.value = futsal.futsalName!;
                                // homePageController.intialPrice.value = futsal.pricePerHour.toString();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => FutsalDetailPage(selectedfutsal: futsal,)),
                                // );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 20, left: 20),
                                child: Card(
                                    color: Color(0xffD9D9D9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          // ClipRRect(
                                          //   child: Image.network(
                                          //     // UrlManipulator(futsal.fieldImage.toString()).replaceBaseUrl(ApiUrl.mainUrl)
                                          //     Utilities().removeDynamicPart(
                                          //       "${homestate.getchallengeAccepted!.data![index].}",
                                          //     ),
                                          //     height: 150,
                                          //     fit: BoxFit.fill,
                                          //     width: double.infinity,
                                          //   ),
                                          //   borderRadius:
                                          //       BorderRadius.circular(10),
                                          // ),
                                          ListTile(
                                            title: Text(
                                              "${Utilities().convertDate(homestate.getchallengeAccepted!.data![index].bookingDate.toString())} , ${Utilities().convertTime(
                                                            homestate.getchallengeAccepted!.data![index].startTime.toString())} : ${Utilities().convertTime(
                                                            homestate.getchallengeAccepted!.data![index].startTime.toString())} ",
                                              // "${homestate.getchallengeAccepted!.data![index].acceptedBy}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            subtitle: Text(
                                              "${homestate.getchallengeAccepted!.data![index].challengeStatus}",
                                            ),
                                          ),
                                          // ElevatedButton(
                                          //     onPressed: () {
                                          //       homestate
                                          //           .acceptchallengeControlleer(
                                          //               context,
                                          //               homestate.getchallenge!
                                          //                   .data![index].id);
                                          //     },
                                          //     child: Text("Accept Challenge"))
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
