import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:delivery_app_shipper_shipper/Src/configs/link.dart';
import 'package:delivery_app_shipper_shipper/Src/models/transaction.dart';

import '../configs/link.dart';

class HistoryApi {
  Future<http.Response> getTransactionByID(String id) {
    return http.get(GET_TRANSACTION_BY_SHIPPERID + id);
  }

  Future<List<Transaction>> convertJsonToListTransaction(http.Response response) async {
    dynamic data = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return data.map<Transaction>((json) => Transaction.fromJson(json)).toList();
  }
}