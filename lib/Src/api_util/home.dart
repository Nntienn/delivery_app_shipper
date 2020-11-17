import 'package:delivery_app_shipper_shipper/Src/models/transaction_detail.dart';
import 'package:delivery_app_shipper_shipper/Src/models/transaction.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app_shipper_shipper/Src/configs/link.dart';
import 'dart:convert';

class HomeApi {

  Future<http.Response> getListTransactionDetailUnFinished() async {
    return http.get(GET_TRANSACTION_DETAIL_UNFINISHED);
  }

  Future<List<TransactionDetail>> convertJsonToListTransactionDetail(http.Response response) async {
    dynamic data = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return data.map<TransactionDetail>((json) => TransactionDetail.fromJson(json)).toList();
  }

  Future<http.Response> doneTransaction(TransactionDetail model) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(model.toJsonPart());
    return await http.put(PUT_TRANSACTION_DETAIL_BY_ID + model.transactionDetailsId.toString() + "/" + model.pickedTime + "/" + model.completedTime + "/" +model.status, headers: headers, body: json);
  }

  Future<void> updateTransaction(Transaction model) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(model.toJsonPart());
    return await http.put(PUT_TRANSACTION_BY_DETAIL_ID + model.transactionDetailsId.toString() + "/" + model.shipperId, headers: headers, body: json);
  }



}