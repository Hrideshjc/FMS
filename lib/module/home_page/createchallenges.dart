import 'package:VMS/module/home_page/home_state.dart';
import 'package:VMS/utils/constant/images_directory.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Createchalleneges extends StatefulWidget {
  const Createchalleneges({super.key});

  @override
  State<Createchalleneges> createState() => _CreatechallenegesState();
}

class _CreatechallenegesState extends State<Createchalleneges> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        print("this is  : $selectedDate ");
        selectedDate = pickedDate;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedStartTime,
    );

    if (pickedTime != null && pickedTime != selectedStartTime) {
      // Update only the hour part and keep the minutes unchanged
      setState(() {
        selectedStartTime = TimeOfDay(hour: pickedTime.hour, minute: 00);
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedEndTime,
    );

    if (pickedTime != null && pickedTime != selectedEndTime) {
      // Update only the hour part and keep the minutes unchanged
      setState(() {
        selectedEndTime = TimeOfDay(hour: pickedTime.hour, minute: 00);
      });
    }
  }

  @override
  void initState() {
    var homeState = Provider.of<HomeState>(context, listen: false);
    homeState.futsalListController(context);
    super.initState();
  }

  var futsalid;
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double? width = MediaQuery.of(context).size.width;
    return Consumer<HomeState>(
      builder: (context, homeState, child) {
        return Scaffold(
          body: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(ImagesDirectory.dashboardImage))),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Newfield()),
                      // );
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
                        SizedBox(
                          height: height * 0.4,
                          child: ListView.builder(
                            itemCount: homeState.getFutsal?.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var futsal = homeState.getFutsal?.data![index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    futsalid = futsal!.id;
                                  });
                                  print("tapped");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, right: 20, left: 20),
                                  child: Card(
                                      color: futsalid != futsal?.id
                                          ? Color(0xffD9D9D9)
                                          : Color(0xff1e4984),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(
                                                futsal!.futsalName.toString(),
                                                style: TextStyle(
                                                    color: futsalid == futsal.id
                                                        ? Color(0xffD9D9D9)
                                                        : Color(0xff1e4984),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              subtitle: Text(
                                                'Rs. ${futsal.pricePerHour.toString()}',
                                                style: TextStyle(
                                                  color: futsalid == futsal.id
                                                      ? Color(0xffD9D9D9)
                                                      : Color(0xff1e4984),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),

                        const Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),

                        const SizedBox(height: 30),
                        Text(
                          'Selected Date: ${selectedDate.toString()}',
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: Text(
                              'Select Date',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Selected Time: ${selectedStartTime.format(context)}  ${selectedEndTime.format(context)}',
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () => _selectTime(context),
                              child: Text(
                                ' Start Time',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => _selectEndTime(context),
                              child: Text('End Time',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10)),
                            ),
                          ],
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                var bookFutsalController =
                                    homeState.challengePlayerController(
                                        context,
                                        "${futsalid}",
                                        "${DateFormat('yyyy-MM-dd').format(selectedDate)}",
                                        "${DateFormat('HH:mm:ss').format(DateFormat('h:mm a').parse(selectedStartTime.format(context)))}",
                                        "${DateFormat('HH:mm:ss').format(DateFormat('h:mm a').parse(selectedEndTime.format(context)))}");
                                // Utilities.showCustomSnackBar("futsal booked.");
                              },
                              child: Text("Challenge")),
                        ),
                        // Row(
                        //   children: [
                        //     const Spacer(),
                        //     Container(
                        //       decoration: BoxDecoration(
                        //           border: Border.all(), color: Colors.blue),
                        //       child: Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //             horizontal: 20, vertical: 5),
                        //         child: Text(
                        //             "Book Hourly Rs. 1000/hr"),
                        //       ),
                        //     ),
                        //     const Spacer(),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
