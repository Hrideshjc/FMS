import 'dart:convert';

import 'package:VMS/module/authentication/login_view/secondSignup.dart';
import 'package:VMS/module/home_page/dashboard.dart';
import 'package:VMS/module/home_page/maindashboard.dart';
import 'package:VMS/utils/api_helper/api_urls.dart';
import 'package:VMS/utils/constant/Utilities.dart';
import 'package:VMS/utils/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/app_route.dart';
import '../../../utils/api_helper/api_base_helper.dart';

class AuthState extends ChangeNotifier {
  AuthState() {
    _checkAuth();
  }

  _checkAuth() async {}

  /*--------------- For login Page ----------*/
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();
  bool viewLoginPassword = true;

  // void submitLoginForm() {
  //   if (loginFormKey.currentState?.validate() ?? false) {
  //     sendLoginData();
  //   }
  // }

  /*--------------- For Registration Page ----------*/
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController nameRegisterController = TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();

  ///used in otp///
  final TextEditingController conformPasswordRegisterController =
      TextEditingController();
  final TextEditingController passwordRegisterController =
      TextEditingController();
  bool viewRegisterConformPassword = true;
  bool viewRegisterPassword = true;

  void submitRegisterForm(BuildContext context) async {
    if (registerFormKey.currentState?.validate() ?? false) {
      var value = await registerCostumerController(context);
      if (value != null) {

        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.signUpVerification,
          (Route<dynamic> route) => false,
        );
      }
    }
  }

  /*--------------- verify-customer Page ----------*/
  final GlobalKey<FormState> otpVerifyFormKey = GlobalKey<FormState>();
  final TextEditingController otpVerifyController = TextEditingController();

  void submitOtpForm(BuildContext context) async {
    if (otpVerifyFormKey.currentState?.validate() ?? false) {
      var value = await verifyCustomerController();
      if (value != null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.homePage,
          (Route<dynamic> route) => false,
        );
      }
    }
  }

  /*--------------- For loading Apis ----------*/
  bool loadingAuth = false;
  bool loadingSignUp = false;
  bool loadingVerify = false;

  /*--------------- Api calling ----------*/
  sendLoginData(BuildContext context) async {
    final authServices = ApiBaseHelper();

    loadingAuth = true;
    notifyListeners();

    var body = {
      "username": emailLoginController.text,
      "password": passwordLoginController.text
    };

    authServices.post(ApiUrl.login, body).then((value) async {
      var body = jsonDecode(value.body);

      if (value.statusCode != 200) {
        Utilities.showCustomSnackBar("${body['message']}");
      } else {
        Constants.currentToken = "${body['accessToken']}";

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MainDashboardPage()));
        Utilities.showCustomSnackBar("${body['message']}");
      }
      // if( value )
      // if (value == null) {
      //   loadingauth = false;
      //   notifyListeners();
      //   Utilities.showCustomSnackBar(context, value["message"]);
      // } else {
      //   if (value["status"] == 200) {
      //     print("inside 200 value : $value");
      //     _isLoggedIn = true;
      //     _loginResponse = LoginResponse.fromJson(value);
      //     Constant.loginToken = _loginResponse!.token!.toString();
      //     Preference.storeUser(json.encode(value));
      //     var locationController = LocationController();
      //     locationController.postLocationToServer();
      //     await getProfile();
      //     loadingauth = false;
      //     notifyListeners();
      //     Utilities.showCustomSnackBar(context, "Login Successful");
      //     Future.delayed(Duration.zero, () {
      //       Navigator.pushReplacement(
      //         context,
      //         AnimatedNavigation(page: const MainScreen()),
      //       );
      //     });
      //     notifyListeners();
      //   } else {
      //     loadingauth = false;
      //     notifyListeners();
      //     Utilities.showCustomSnackBar(context, value["message"]);
      //   }
      // }
      loadingAuth = false;
      notifyListeners();
    }); // Call the login method on the instance
  }

  registerCostumerController(BuildContext context) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();
    var body = {
      "username": nameRegisterController.text,
      "userRole": "player",
      "password": passwordRegisterController.text
    };
    var response = await authServices.post(ApiUrl.signUp, body);

    notifyListeners();

    if (response.body != null) {
      var data = jsonDecode(response.body);
      loadingSignUp = false;

      Utilities.showCustomSnackBar(data["message"]);
      if (data['status'] == false) {
      } else {
//  Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>  SecondSignup()));
      }
    }
  }

  registerCostumerInformationController(BuildContext context, firstName,
      lastName, age, email, phone, position) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();
    var body = {
      "firstName": "$firstName",
      "lastName": "$lastName",
      "age": "$age",
      "email": "$email",
      "phone": "$phone",
      "position": "$position"
    };

    var response =
        await authServices.post(ApiUrl.registerInformation, jsonEncode(body));

    notifyListeners();

    if (response.body != null) {
      var data = jsonDecode(response.body);
      loadingSignUp = false;

      Utilities.showCustomSnackBar(data["message"]);
      if (data['status'] == false) {
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MainDashboardPage()));
      }
    }
  }

  verifyCustomerController() async {
    final authServices = ApiBaseHelper();
    loadingVerify = true;
    notifyListeners();
    var body = {
      "email": emailRegisterController.text,
      "otp": otpVerifyController.text,
    };

    var response = await authServices.post(ApiUrl.verify, body);

    notifyListeners();
    if (response != null) {
      loadingVerify = false;
      if (response['error'] == true) {
        switch (response['msg']) {
          case "email":
            Utilities.showCustomSnackBar(response["message"]["email"][0]);

            break;
          case "otp":
            Utilities.showCustomSnackBar(response["msg"]["otp"][0]);

            break;

          default:
            Utilities.showCustomSnackBar(response["msg"]);

            break;
        }
      } else {
        Utilities.showCustomSnackBar(response["msg"]);
        return response;
      }
    }
  }
}
