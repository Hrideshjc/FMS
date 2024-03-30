import 'dart:convert';
import 'dart:io';
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
    try {
      var cookie = Cookie("sessionString",
          "rade%7C1ed32990-12cd-4438-b26d-1c30061b762e%7C9000eefec90ab38d9db38e1c51aa9ab1c2c04a85e568411bbc3f7d396609d8f6");

      var headers = {
        // 'Host': '192.168.1.8:3000',
        'Connection': 'keep-alive',
        // 'Cache-Control': 'max-age=0',
        // 'Upgrade-Insecure-Requests': '1',
        // 'User-Agent':
        //     'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36',
        // 'Accept':
        //     'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
        'Accept-Encoding': 'gzip, deflate',
        // 'Accept-Language': 'en-GB,en-US;q=0.9,en;q=0.8',
        'Cookie': 'sessionString=Terobau',
        'If-None-Match': 'W/"10-/VnJyQBB0+b7i4NY83P42KKVWsM"'
      };

      final response = await http.get(Uri.parse(url), headers: headers);
      print("this is response ${response.body}");
      print(" this is the header ${response.headers}");
      //  return response;
      return null;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
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
