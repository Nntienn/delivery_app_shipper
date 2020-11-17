import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:delivery_app_shipper_shipper/Src/configs/link.dart';
import 'package:delivery_app_shipper_shipper/Src/models/transaction.dart';

import '../configs/link.dart';
import '../models/transaction_detail.dart';

class HistoryApi {
  Future<TransactionDetail> convertJsonToTransactionDetail(http.Response response) async {
    TransactionDetail transactionDetail = TransactionDetail.fromJson(jsonDecode(response.body));
    return transactionDetail;
  }

  Future<http.Response> getTransactionDetailByID(String id) async {
    return http.get(GET_TRANSACTION_DETAIL_BY_ID + id);
  }

  Future<List<Transaction>> getListTransactionTypeSending(List<Transaction> list) async {
    List<Transaction> listResult = List();
    list.forEach((element) {
      if (element.type.compareTo("sending") == 0) {
        listResult.add(element);
      }
    });
    return listResult;
  }

  Future<http.Response> getTransactionByShipperID(String id) async {
    return http.get(GET_TRANSACTION_BY_SHIPPERID + id);
  }

  Future<http.Response> getTransactionByID(String id) {
    return http.get(GET_TRANSACTION_BY_SHIPPERID + id);
  }

  Future<List<Transaction>> convertJsonToListTransaction(http.Response response) async {
    dynamic data = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return data.map<Transaction>((json) => Transaction.fromJson(json)).toList();
  }
}