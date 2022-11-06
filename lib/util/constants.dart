import 'dart:convert';

const String URL_LINK =
    'https://www.erp.intalogi.com/kinetic-presales/api/v1/Ice.BO.UD01Svc/UD01s';

var headers = {
  "Accept": "application/json",
  "Authorization": 'Basic ${base64.encode(utf8.encode('manager:manager'))}',
  "Content-Type": "application/json",
};
