import 'package:epicor/model/response.dart';
import 'package:epicor/model/ud01.dart';
import 'package:epicor/util/constants.dart';
import 'package:get/get.dart';

class UD01Service extends GetConnect {
  List<UD01> ud01s = [];
  ResponseAPI resdata = ResponseAPI();

  var body = {
    "Company": "EPIC06",
    "Key1": '',
    "Key2": '',
    "Key3": '',
    "Key4": '',
    "Key5": '',
    "Character01": '',
    "Character02": '',
    "Number01": '',
    "RowMod": "A"
  };

  Future<dynamic> getList() async {
    try {
      var response = await get(URL_LINK, headers: headers);
      if (response.statusCode == 200) {
        var datas = response.body['value'];

        for (var data in datas) {
          UD01 ud = UD01(Key1: '');
          ud.Key1 = data['Key1'];
          ud.Character01 = data['Character01'];
          ud.Character02 = data['Character02'];
          ud.Number01 = data['Number01'];
          ud01s.add(ud);
        }
        resdata.code = response.statusCode;
        resdata.status = response.statusText;
        resdata.data = ud01s;
      } else {
        resdata.code = response.statusCode;
      }
      return resdata;
    } catch (e) {
      print('Error ${e.toString()}');
      return resdata.code = 0;
    }
  }

  Future add(UD01 model) async {
    try {
      var data = body;
      data['Key1'] = model.Key1;
      data['Key2'] = model.Key1;
      data['Key3'] = model.Key1;
      data['Key4'] = model.Key1;
      data['Key5'] = model.Key1;
      data['Character01'] = model.Character01!;
      data['Character02'] = model.Character02!;
      data['Number01'] = model.Number01!;

      var response = await post(URL_LINK, headers: headers, data);
      if (response.statusCode == 201) {
        resdata.code = response.statusCode;
        resdata.status = response.statusText;
      } else {
        resdata.code = response.statusCode;
      }
      data.clear();
      return resdata;
    } catch (e) {
      print('Error ${e.toString()}');
      return resdata.code = 0;
    }
  }

  Future edit(UD01 model) async {
    try {
      var data = body;
      data['Key1'] = model.Key1;
      data['Key2'] = model.Key1;
      data['Key3'] = model.Key1;
      data['Key4'] = model.Key1;
      data['Key5'] = model.Key1;
      data['Character01'] = model.Character01!;
      data['Character02'] = model.Character02!;
      data['Number01'] = model.Number01!;

      var response = await post(URL_LINK, headers: headers, data);
      if (response.statusCode == 201) {
        resdata.code = response.statusCode;
        resdata.status = response.statusText;
      } else {
        resdata.code = response.statusCode;
      }

      return resdata;
    } catch (e) {
      print('Error $e');
    }
  }

  Future remove(String id) async {
    var itemID = id;
    try {
      var response = await delete(
          '$URL_LINK/(EPIC06,$itemID,$itemID,$itemID,$itemID,$itemID)',
          headers: headers);
      if (response.statusCode == 204) {
        resdata.code = response.statusCode;
        resdata.status = response.statusText;
      } else {
        resdata.code = response.statusCode;
      }
      return resdata;
    } catch (e) {
      print('Error $e');
    }
  }
}
