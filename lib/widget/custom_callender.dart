// import 'package:flutter/material.dart';




// class DatePickerExample extends StatefulWidget {
//   const DatePickerExample({super.key, this.restorationId});

//   final String? restorationId;

//   @override
//   State<DatePickerExample> createState() => _DatePickerExampleState();
// }

// /// RestorationProperty objects can be used because of RestorationMixin.
// class _DatePickerExampleState extends State<DatePickerExample>
//     with RestorationMixin {
//   // In this example, the restoration ID for the mixin is passed in through
//   // the [StatefulWidget]'s constructor.
//   @override
//   String? get restorationId => widget.restorationId;

//   final RestorableDateTime _selectedDate =
//       RestorableDateTime(DateTime(2021, 7, 25));
//   late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
//       RestorableRouteFuture<DateTime?>(
//     onComplete: _selectDate,
//     onPresent: (NavigatorState navigator, Object? arguments) {
//       return navigator.restorablePush(
//         _datePickerRoute,
//         arguments: _selectedDate.value.millisecondsSinceEpoch,
//       );
//     },
//   );

 
//   static Route<DateTime> _datePickerRoute(
//     BuildContext context,
//     Object? arguments,
//   ) {
//     return DialogRoute<DateTime>(
//       context: context,
//       builder: (BuildContext context) {
//         return DatePickerDialog(
//           restorationId: 'date_picker_dialog',
//           initialEntryMode: DatePickerEntryMode.calendarOnly,
//           initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
//           firstDate: DateTime(2021),
//           lastDate: DateTime(2022),
//         );
//       },
//     );
//   }


// }
