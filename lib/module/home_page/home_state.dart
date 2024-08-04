import 'dart:convert';

import 'package:VMS/model/accepted_challenge.dart';
import 'package:VMS/model/booking_model.dart';
import 'package:VMS/model/chalenge_histor.dart';
import 'package:VMS/model/challenge_model.dart';
import 'package:VMS/model/futsal_field.dart';
import 'package:VMS/module/home_page/dashboard.dart';
import 'package:VMS/module/home_page/maindashboard.dart';
import 'package:VMS/utils/api_helper/api_base_helper.dart';
import 'package:VMS/utils/api_helper/api_urls.dart';
import 'package:VMS/utils/constant/Utilities.dart';
import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier {
  bool loadingSignUp = false;

  FutsalModel? get getFutsal => _getFutsal;
  FutsalModel? _getFutsal;
  BookingModel? get getBooking => _getBooking;
  BookingModel? _getBooking;
  ChallengeModel? get getchallenge => _getChallenge;
  ChallengeModel? _getChallenge;
  challengeHistory? get getchallengeHistory => _getChallengeHistory;
  challengeHistory? _getChallengeHistory;
  AcceptedChallenge? get getchallengeAccepted => _getChallengeAccepted;
  AcceptedChallenge? _getChallengeAccepted;

  futsalListController(BuildContext context) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();

    var response = await authServices.getWithToken(ApiUrl.futsal);

    notifyListeners();
    print("object ${ApiUrl.futsal}");
    print(":this is response1 ${jsonEncode(response)}");

    // if (response.statusCode == 200) {
    loadingSignUp = false;
    _getFutsal = FutsalModel.fromJson(response);

    print("this is response1233 ${_getFutsal}");

    notifyListeners();
    // }/
  }

  searchfutsalController(BuildContext context, quary) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();

    var response =
        await authServices.getWithToken("${ApiUrl.searchFutsal}$quary");

    notifyListeners();
    print(":this is response1234555 ${jsonEncode(response)}");

    // if (response.statusCode == 200) {
    loadingSignUp = false;
    _getFutsal = FutsalModel.fromJson(response);

    print("this is response1233 ${_getFutsal}");

    notifyListeners();
    // }/
  }

  bookingController() async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();

    var response = await authServices.getWithToken(ApiUrl.bookedFutsal);

    notifyListeners();
    print(":this is booking ${jsonEncode(response)}");

    // if (response.statusCode == 200) {
    loadingSignUp = false;
    _getBooking = BookingModel.fromJson(response);

    // print("this is response booking ${_getFutsal}");

    notifyListeners();
    // }/
  }

  bookFutsalController(
      BuildContext context, futsalId, bookingDate, startDate, endDate) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();

    var body = {
      "futsalId": futsalId,
      "bookingDate": bookingDate,
      "startTime": "$bookingDate $startDate",
      "endTime": "$bookingDate $endDate",
      "bookingStatus": "booked"
    };

    print("this is futsal body : $body");

    // var body = {
    //     "futsalId": "1",
    //   "bookingDate": "2024-03-03",
    //   "startTime": "2024-03-03 04:00:00",
    //   "endTime": "2024-03-03 05:00:00",
    //   "bookingStatus": "booked"
    // };
    var response =
        await authServices.postWithToken(ApiUrl.bookFutsal, jsonEncode(body));

    notifyListeners();
    print(":this is response1234555 ${jsonEncode(response)}");

    // if (response.statusCode == 200) {
    loadingSignUp = false;
    Utilities.showCustomSnackBar("${response["message"]}");
    // _getFutsal = FutsalModel.fromJson(response);

    print("this is response1233 ${_getFutsal}");

    notifyListeners();
    // }/
  }

  challengePlayerController(
      BuildContext context, futsalId, bookingDate, startDate, endDate) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();

    var body = {
      "futsalId": futsalId,
      "bookingDate": bookingDate,
      "startTime": "$bookingDate $startDate",
      "endTime": "$bookingDate $endDate",
      "bookingStatus": "booked"
    };

    print("this is futsal body : $body");

    var response =
        await authServices.postWithToken(ApiUrl.challenge, jsonEncode(body));

    notifyListeners();
    print(":this is response1234555 ${jsonEncode(response)}");

    // if (response.statusCode == 200) {
    loadingSignUp = false;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainDashboardPage()),
    );
    Utilities.showCustomSnackBar("${response["message"]}");
    // _getFutsal = FutsalModel.fromJson(response);

    print("this is response1233 ${_getFutsal}");

    notifyListeners();
    // }/
  }

  challengeListController(BuildContext context) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();

    var response = await authServices.getWithToken(ApiUrl.getchallenge);

    notifyListeners();
    print(":this is response1234555 ${jsonEncode(response)}");

    // if (response.statusCode == 200) {
    loadingSignUp = false;
    _getChallenge = ChallengeModel.fromJson(response);

    print("this is response1233 ${_getFutsal}");

    notifyListeners();
    // }/
  }

  challengehistorController(BuildContext context) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    // notifyListeners();

    var response = await authServices.getWithToken(ApiUrl.getchallengeHistory);

    notifyListeners();
    print(":this is response1234555 ${jsonEncode(response)}");

    // if (response.statusCode == 200) {
    loadingSignUp = false;
    _getChallengeHistory = challengeHistory.fromJson(response);

    print("this is response1233 ${_getFutsal}");

    notifyListeners();
    // }/
  }

  challengeAcceptedController(BuildContext context) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();

    var response = await authServices.getWithToken(ApiUrl.abcceptedChallenge);

    notifyListeners();
    print(":this is response1234555 ${jsonEncode(response)}");

    // if (response.statusCode == 200) {
    loadingSignUp = false;
    _getChallengeAccepted = AcceptedChallenge.fromJson(response);

    print("this is response1233 ${_getFutsal}");

    notifyListeners();
    // }/
  }

  acceptchallengeControlleer(BuildContext context, challengeID) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();

    var response = await authServices.postWithTokennoBody(
        // "http://192.168.1.2:3000/challenge/acceptChallenge/6");
        "${ApiUrl.acceptChallenge}$challengeID");

    notifyListeners();
    print(":this is response1234555 ${jsonEncode(response)}");

    // if (response.statusCode == 200) {
    loadingSignUp = false;
    Utilities.showCustomSnackBar("${response["message"]}");
    // _getFutsal = FutsalModel.fromJson(response);

    print("this is response1233 ${_getFutsal}");

    notifyListeners();
    // }/
  }

  deletechallengeControlleer(BuildContext context, challengeID) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();

    var response = await authServices
        .deleteWithToken("${ApiUrl.deleteChallenge}$challengeID");

    notifyListeners();
    print(":this is response1234555 ${jsonEncode(response)}");

    // if (response.statusCode == 200) {
    loadingSignUp = false;
    challengehistorController(context);
    Utilities.showCustomSnackBar("${response["message"]}");
    // _getFutsal = FutsalModel.fromJson(response);

    print("this is response1233 ${_getFutsal}");

    notifyListeners();
    // }/
  }

  cancelbooking(BuildContext context, challengeID) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();

    var response = await authServices
        .deleteWithToken("${ApiUrl.canccelbooking}$challengeID");

    notifyListeners();
    print(":this is response1234555 ${jsonEncode(response)}");

    // if (response.statusCode == 200) {
    loadingSignUp = false;
    bookingController();
    // challengehistorController(context);
    Utilities.showCustomSnackBar("${response["message"]}");
    // _getFutsal = FutsalModel.fromJson(response);

    print("this is response1233 ${_getFutsal}");

    notifyListeners();
    // }/
  }
}
