import 'dart:convert';
import 'package:delivery_app_shipper_shipper/Src/configs/link.dart';
import 'package:http/http.dart' as http;

import 'package:delivery_app_shipper_shipper/Src/models/transaction_detail.dart';

class RequestCartApi{
  Future<http.Response> acceptSending(TransactionDetail model) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(model.toJsonPart());
    return await http.put(PUT_TRANSACTION_DETAIL_BY_ID + model.transactionDetailsId.toString() + "/" + model.pickedTime + "/" + model.completedTime + "/" +model.status, headers: headers, body: json);
  }
}