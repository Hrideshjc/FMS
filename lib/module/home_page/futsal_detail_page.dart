import 'package:VMS/controller/fieldcontroller.dart';
import 'package:VMS/model/futsal_field.dart';
import 'package:VMS/module/home_page/home_state.dart';
import 'package:VMS/module/home_page/newfields.dart';
import 'package:VMS/utils/constant/images_directory.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../utils/constant/Utilities.dart';

class FutsalDetailPage extends StatefulWidget {
  Data selectedfutsal;
  FutsalDetailPage({super.key, required this.selectedfutsal});

  @override
  State<FutsalDetailPage> createState() => _FutsalDetailPageState();
}

class _FutsalDetailPageState extends State<FutsalDetailPage> {
  List<String> _timeIntervals = [];

  @override
  void initState() {
    super.initState();
    _generateTimeIntervals();
  }

  void _generateTimeIntervals() {
    for (int i = 6; i <= 21; i++) {
      String time =
          i < 12 ? '$i:00 AM' : (i == 12 ? '12:00 PM' : '${i - 12}:00 PM');
      _timeIntervals.add(time);
    }
  }

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
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    double? width = MediaQuery.of(context).size.width;
    return Consumer<HomeState>(
      builder: (context, homeState, child) {
        return Scaffold(
          body: Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                        ClipRRect(
                          child: Image.network(Utilities().removeDynamicPart(
                              widget.selectedfutsal.fieldImage.toString())),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        const SizedBox(height: 20),
                        // Text(
                        //   "this is value ",
                        //   // homePageController.initialName.value,
                        //   style: const TextStyle(
                        //       fontWeight: FontWeight.w500, fontSize: 15),
                        // ),
                        Text('Rs. ${widget.selectedfutsal.pricePerHour}'),
                        Text('${widget.selectedfutsal.futsalLocation}'),
                        Text('${widget.selectedfutsal.futsalName}'),
                        const Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        // SingleChildScrollView(
                        //   scrollDirection: Axis.horizontal,
                        //   child: Row(
                        //     children: List.generate(7, (index) {
                        //       DateTime dateTime =
                        //           DateTime.now().add(Duration(days: index));
                        //       List<String> weekNames = [
                        //         'Monday',
                        //         'Tuesday',
                        //         'Wednesday',
                        //         'Thursday',
                        //         'Friday',
                        //         'Saturday',
                        //         'Sunday'
                        //       ];


                        //       List<String> monthNames = [
                        //         'January',
                        //         'February',
                        //         'March',
                        //         'April',
                        //         'May',
                        //         'June',
                        //         'July',
                        //         'August',
                        //         'September',
                        //         'October',
                        //         'November',
                        //         'December'
                        //       ];
                        //       return Padding(
                        //         padding: const EdgeInsets.only(bottom: 10),
                        //         child: Container(
                        //           padding: const EdgeInsets.all(8),
                        //           decoration:
                        //               BoxDecoration(border: Border.all()),
                        //           child: Column(
                        //             children: [
                        //               Text(weekNames[dateTime.weekday - 1]),
                        //               Text(dateTime.day.toString()),
                        //               Text(monthNames[dateTime.month - 1])
                        //             ],
                        //           ),
                        //         ),
                        //       );
                        //     }),
                        //   ),
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Container(
                        //       decoration: BoxDecoration(
                        //           border: Border.all(), color: Colors.blue),
                        //       child: const Padding(
                        //         padding: EdgeInsets.symmetric(horizontal: 20),
                        //         child: Text("Time"),
                        //       ),
                        //     ),
                        //     Container(
                        //       decoration: BoxDecoration(border: Border.all()),
                        //       child: const Padding(
                        //         padding: EdgeInsets.symmetric(horizontal: 20),
                        //         child: Text("Time"),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(height: 10),
                        // DropdownButton<String>(
                        //   value: _timeIntervals.first, // Default value
                        //   onChanged: (newValue) {
                        //     setState(() {
                        //       // Update selected value

                        //       _timeIntervals.first = newValue!;
                        //     });
                        //   },
                        //   items: _timeIntervals.map((String value) {
                        //     return DropdownMenuItem<String>(
                        //       value: value,
                        //       child: Text(value),
                        //     );
                        //   }).toList(),
                        // ),

                        const SizedBox(height: 30),
                        Text(
                          'Selected Date: ${Utilities().convertDate(selectedDate.toString())}',
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
                                print(
                                    'This is date: ${selectedDate.toString().substring(0, 10)}');
                                var bookFutsalController = homeState.bookFutsalController(
                                    context,
                                    "${widget.selectedfutsal.id}",
                                    "${selectedDate.toString().substring(0, 10)}",
                                    // "${DateFormat('yyyy-MM-dd').format(selectedDate)}",
                                    "${DateFormat('HH:mm:ss').format(DateFormat('h:mm a').parse(selectedStartTime.format(context)))}",
                                    "${DateFormat('HH:mm:ss').format(DateFormat('h:mm a').parse(selectedEndTime.format(context)))}");
                                // Utilities.showCustomSnackBar("futsal booked.");
                              },
                              child: Text("Book futsal")),
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
