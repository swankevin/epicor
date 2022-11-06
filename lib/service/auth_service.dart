import 'dart:convert';
import 'package:epicor/model/response.dart';
import 'package:epicor/util/constants.dart';
import 'package:get/get.dart';

class AuthService extends GetConnect {
  Future connect(Map<dynamic, dynamic> data) async {
    try {
      var success = false;

      var headers = {
        "Accept": "application/json",
        "Authorization": 'Basic ' +
            base64.encode(
              utf8.encode('${data['username']}:${data['password']}'),
            ),
        "Content-Type": "application/json",
      };

      //var uri = Uri.parse(URL_LINK);
      Response response = await get(URL_LINK, headers: headers);

      if (response.statusCode == 200) {
        success = true;
      }
      return success;
    } on Exception {
      return false;
    }
  }
}
