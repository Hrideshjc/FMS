import 'package:VMS/module/home_page/home_state.dart';
import 'package:VMS/utils/constant/Utilities.dart';
import 'package:VMS/utils/constant/images_directory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  @override
  void initState() {
    var controller = Provider.of<HomeState>(context, listen: false);
    controller.bookingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double? width = MediaQuery.of(context).size.width;
    return Consumer<HomeState>(builder: (context, homePage, _) {
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
                            // homePageController.searchFutsal.value = newValue;
                          },
                        )),
                  ),
                  const SizedBox(height: 5),
                  if (homePage.getBooking != null)
                    Expanded(
                        child: ListView.builder(
                      itemCount: homePage.getBooking!.data!.length,
                      itemBuilder: (context, index) {
                        var futsal = homePage.getBooking!.data![index];
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
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          ImagesDirectory.booking,
                                        ),
                                      ),
                                      ListTile(
                                        title: Center(
                                          child: Text(
                                            "${futsal.futsalName}",
                                            // Utilities().convertDate(
                                            //     futsal..toString()),
                                            // futsal.endTime.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        subtitle: Column(
                                          children: [
                                            Text(
                                                'Start: ${Utilities().convertTime(futsal.startTime.toString())}'),
                                            Text(
                                                'End:${Utilities().convertTime(futsal.endTime.toString())}'),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          homePage.cancelbooking(
                                              context, futsal.id);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.red),
                                        ),
                                        child: Text("Cancel booking"),
                                      )
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
    });
  }
}
