import 'dart:convert';
import 'dart:io';
import 'package:VMS/utils/constant/constant.dart';
import 'package:http/http.dart' as http;

import 'app_exception.dart';

class ApiBaseHelper {
  Future<dynamic> get(String url) async {
    // var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      print("this is response ${response.body}");
      print("this is response ${response.statusCode}");
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    // return responseJson;
  }

  Future<dynamic> getWithToken(String url) async {
    // var responseJson;
    print("this is token: ${Constants.currentToken}");
    // try {


      var headers = {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${Constants.currentToken}',
      };

      final response = await http.get(Uri.parse(url), headers: headers);
      print("this is response ${response.body}");
      print(" this is the header ${response.headers}");
      //  return response;
      return jsonDecode(response.body);
    // } on SocketException {
    //   throw FetchDataException('No Internet connection');
    // }
    // return responseJson;
  }



  Future<dynamic> postWithToken(String url, body) async {
    // var responseJson;
    print("this is token: ${Constants.currentToken}");
    // try {


      var headers = {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${Constants.currentToken}',
      };

      final response = await http.post(Uri.parse(url),body: body, headers: headers);
      print("this is response ${response.body}");
      print(" this is the header ${response.headers}");
      //  return response;
      return jsonDecode(response.body);
    // } on SocketException {
    //   throw FetchDataException('No Internet connection');
    // }
    // return responseJson;
  }

    Future<dynamic> postWithTokennoBody(String url, ) async {
    // var responseJson;
    print("this is token: ${Constants.currentToken}");
    // try {


      var headers = {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${Constants.currentToken}',
      };

      final response = await http.post(Uri.parse(url), headers: headers);
      print("this is response ${response.body}");
      print(" this is the header ${response.headers}");
      //  return response;
      return jsonDecode(response.body);
    // } on SocketException {
    //   throw FetchDataException('No Internet connection');
    // }
    // return responseJson;
  }

  Future<dynamic> deleteWithToken(String url) async {
    // var responseJson;
    print("this is token: ${Constants.currentToken}");
    // try {


      var headers = {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${Constants.currentToken}',
      };

      final response = await http.delete(Uri.parse(url), headers: headers);
      print("this is response ${response.body}");
      print(" this is the header ${response.headers}");
      //  return response;
      return jsonDecode(response.body);
    // } on SocketException {
    //   throw FetchDataException('No Internet connection');
    // }
    // return responseJson;
  }

  Future<dynamic> post(
    String url,
    body,
  ) async {
    // var responseJson;
    // try {

    var headers = {
      "Content-Type": "application/json",
      // / Add any additional headers here
    };
    print("this is url $url");
    final response = await http.post(Uri.parse(url),
        body: jsonEncode(body), headers: headers);
    // responseJson = _returnResponse(response);
    print("this is response ${response.body}");
    print("this is response ${response.headers}");
    // } on SocketException {
    //   throw FetchDataException('No Internet connection');
    // }
    // if(response.statusCode == 200) {
    return response;
    // }/
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw throw BadRequestException(response.body.toString());

        FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
