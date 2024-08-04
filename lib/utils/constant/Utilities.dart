import 'dart:convert';

import 'package:VMS/utils/api_helper/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';


class Utilities {



  static dateFormationFromArray(date) {
    if (date != null) {
      var dom = DateFormat('d MMM y', 'en_US')
          .format(DateTime(date![0], date![1], date![2]));
      return dom;
    }
    return '';
  }

  static void showCustomSnackBar(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String formatTimeAgo(int? unixTimestamp) {
    final DateTime now = DateTime.now();
    final DateTime timestamp =
    DateTime.fromMillisecondsSinceEpoch(unixTimestamp!);

    final Duration difference = now.difference(timestamp);
    if (difference.inDays > 0) {
      return DateFormat('yyyy-MM-dd').format(timestamp);
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hr';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} min';
    } else {
      return 'just now';
    }
  }

  static String formatAgo(int? unixTimestamp) {
    final DateTime now = DateTime.now();
    final DateTime timestamp =
    DateTime.fromMillisecondsSinceEpoch(unixTimestamp!);

    final Duration difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inMinutes == 1) {
      return '1 min ago';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} mins ago';
    } else if (difference.inHours == 1) {
      return '1 hr ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} hrs ago';
    } else if (difference.inDays == 1) {
      return '1 day ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 60) {
      return '1 month ago';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else {
      return '1 year ago';
    }
  }

  static String dateFormateInt(int? unixTimestamp) {
    final DateTime now = DateTime.now();
    final DateTime timestamp =
    DateTime.fromMillisecondsSinceEpoch(unixTimestamp!);

    final Duration difference = now.difference(timestamp);
    if (difference.inDays > 0) {
      // Return formatted date and time

      if (difference.inDays <= 7) {
        return DateFormat('EEE h:mm a').format(timestamp);
      } else {
        // If more than a week, show month and day (21st Aug)
        return DateFormat('d MMM').format(timestamp);
      }
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hrs ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} min ago';
    } else {
      return 'just now';
    }
  }

  static String convertAndFormat(dateTimeComponents) {
    DateTime dateTime = DateTime(
      dateTimeComponents[0],
      // Year
      dateTimeComponents[1],
      // Month
      dateTimeComponents[2],
      // Day
      dateTimeComponents[3],
      // Hour
      dateTimeComponents[4],
      // Millisecond (converted to microseconds)
    );

    String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    return formattedDateTime;
  }

  static String arrayToLocalDateTime(List<int> dateList) {
    // Check if the list has at least 5 elements
    if (dateList.length < 5) {
      throw ArgumentError('List must have at least 5 elements');
    }

    // Create a DateTime object
    DateTime dateTime = DateTime(
        dateList[0], dateList[1], dateList[2], dateList[3], dateList[4]);

    // Format the DateTime object
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime);
  }

  static DateTime parseDateFromArray(List<int> dateTimeArray) {
    if (dateTimeArray.length >= 5) {
      return DateTime(
        dateTimeArray[0], // year
        dateTimeArray[1], // month
        dateTimeArray[2], // day
        dateTimeArray[3], // hour
        dateTimeArray[4], // minute
      );
    } else {
      throw ArgumentError('Invalid date array format');
    }
  }

  static String getFileTypeFromPath(String filePath) {
    String fileExtension = filePath.split('.').last.toLowerCase();
    if (fileExtension == 'jpg' ||
        fileExtension == 'jpeg' ||
        fileExtension == 'jpeg' ||
        fileExtension == 'png') {
      return 'image/$fileExtension';
    } else if (fileExtension == 'mp4' ||
        fileExtension == 'mov' ||
        fileExtension == 'avi') {
      return 'video/$fileExtension';
    } else if (fileExtension == 'mp3' ||
        fileExtension == 'm4a' ||
        fileExtension == 'ogg') {
      return 'audio/$fileExtension';
    } else if (fileExtension == 'pdf' ||
        fileExtension == 'doc' ||
        fileExtension == 'docx' ||
        fileExtension == 'xls' ||
        fileExtension == 'xlsx' ||
        fileExtension == 'ppt' ||
        fileExtension == 'pptx' ||
        fileExtension == 'txt' ||
        fileExtension == 'csv') {
      return 'TEXT/$fileExtension';
    } else {
      return 'unknown';
    }
  }

  static String formatNumber(int number) {
    if (number < 1000) {
      return number.toString();
    } else if (number < 1000000) {
      double num = number / 1000;
      return num.toStringAsFixed(1) + 'k';
    } else {
      double num = number / 1000000;
      return num.toStringAsFixed(1) + 'M';
    }
  }
  String convertDate(String timeString) {
    // Parse the given string into a DateTime object
    DateTime dateTime = DateTime.parse(timeString);

    // Format the DateTime object into "MMMM d, yyyy" format (e.g., "April 10, 2024")
    String formattedDate = DateFormat("MMMM d, yyyy").format(dateTime);

    return formattedDate;
  }

  String convertTime(String timeString) {
    // Parse the given string into a DateTime object
    DateTime dateTime = DateTime.parse(timeString);

    // Format the DateTime object into "h:mm a" format (e.g., "3:00 PM")
    String formattedTime = DateFormat("h:mm a").format(dateTime);

    return formattedTime;
  }
    String removeDynamicPart(String originalUrl) {
    RegExp regex = RegExp(r"http:\/\/[\w\.:]+\/");
    var value = "${ApiUrl.mainUrl}${ originalUrl.replaceFirst(regex, "")}";
    return value;
  }
}



