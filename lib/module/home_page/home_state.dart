import 'dart:convert';

import 'package:VMS/model/futsal_field.dart';
import 'package:VMS/module/home_page/dashboard.dart';
import 'package:VMS/utils/api_helper/api_base_helper.dart';
import 'package:VMS/utils/api_helper/api_urls.dart';
import 'package:VMS/utils/constant/Utilities.dart';
import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier{


bool loadingSignUp  = false;
var futsal;

 futsalListController(BuildContext context) async {
    final authServices = ApiBaseHelper();
    loadingSignUp = true;
    notifyListeners();
  

    var response = await authServices.get(ApiUrl.futsal);

    notifyListeners();
 

    if (response.statusCode == 200) {
 loadingSignUp = true;
       futsal   = jsonDecode(response.body);
    
      print("this is response1233 ${futsal}");
      
    notifyListeners();
    }
  }

}