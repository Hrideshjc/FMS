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

class Challenges extends StatefulWidget {
  const Challenges({super.key});

  @override
  State<Challenges> createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  @override
  void initState() {
    var homeState = Provider.of<HomeState>(context, listen: false);
    homeState.challengehistorController(context);
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            // InkWell()
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Createchalleneges()));
                              },
                              child: Container(
                                height: 140,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        217, 231, 231, 227),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                  child: Text("Create"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Acceptchallenges()));
                          },
                          child: Container(
                            height: 140,
                            width: 170,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(217, 231, 231, 227),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text("Accept challenges"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 8),
                      child: TextButton.icon(
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "My Challenges",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: ListView.builder(
                          itemCount:
                              // homestate.getchallengeHistory!.data!.length,
                              homestate.getchallengeHistory?.data?.length ?? 0,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var challenge =
                                homestate.getchallengeHistory?.data?[index];
                            if (challenge == null) {
                              return SizedBox
                                  .shrink(); // Return an empty widget if the challenge is null
                            }
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // ClipRRect(
                                          //   child: Image.network(
                                          //     // "${homestate.getchallengeHistory!.data![index].fieldImage}",
                                          //     // UrlManipulator(futsal.fieldImage.toString()).replaceBaseUrl(ApiUrl.mainUrl)
                                          //     // Utilities().removeDynamicPart(
                                          //     //   "${homestate.getchallengeHistory!.data![index].fieldImage}",
                                          //     // ),
                                          //     height: 150,
                                          //     fit: BoxFit.fill,
                                          //     width: double.infinity,
                                          //   ),
                                          //   borderRadius:
                                          //       BorderRadius.circular(10),
                                          // ),
                                          Text(
                                            "${homestate.getchallengeHistory!.data![index].futsalName}",
                                            style: const TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "${homestate.getchallengeHistory!.data![index].futsalLocation}",
                                            style: const TextStyle(
                                                // fontSize: 19,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            // UrlManipulator(futsal.fieldImage.toString()).toString(),
                                            "${Utilities().convertDate(homestate.getchallengeHistory!.data![index].bookingDate.toString())} , \n${Utilities().convertTime(homestate.getchallengeHistory!.data![index].startTime.toString())} : ${Utilities().convertTime(homestate.getchallengeHistory!.data![index].endTime.toString())} ",

                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "${homestate.getchallengeHistory!.data![index].bookingStatus}",
                                          ),
                                          // ListTile(
                                          //   title: Text(
                                          //     // UrlManipulator(futsal.fieldImage.toString()).toString(),
                                          //     "${Utilities().convertDate(homestate.getchallengeHistory!.data![index].bookingDate.toString())} , \n${Utilities().convertTime(homestate.getchallengeHistory!.data![index].startTime.toString())} : ${Utilities().convertTime(homestate.getchallengeHistory!.data![index].endTime.toString())} ",

                                          //     style: const TextStyle(
                                          //         fontWeight: FontWeight.w500),
                                          //   ),
                                          //   subtitle: Text(
                                          //     "${homestate.getchallengeHistory!.data![index].bookingStatus}",
                                          //   ),
                                          // ),
                                          Center(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                homestate
                                                    .deletechallengeControlleer(
                                                        context,
                                                        homestate
                                                            .getchallengeHistory!
                                                            .data![index]
                                                            .id);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.red),
                                              ),
                                              child: Text("Delete Challenge"),
                                            ),
                                          )
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
