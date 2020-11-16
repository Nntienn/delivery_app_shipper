import 'dart:convert';

import 'package:delivery_app_shipper_shipper/Src/configs/link.dart';
import 'package:delivery_app_shipper_shipper/Src/models/account.dart';
import 'package:delivery_app_shipper_shipper/Src/models/sender.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:delivery_app_shipper_shipper/Src/models/wallet.dart';

import '../configs/link.dart';
import '../configs/link.dart';

class RegisterApi {
  Future<Response> postAccount(Account account) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(account.toJson());
    Response response = await post(POST_ACCOUNT, headers: headers, body: json);
    return response;
  }

  Future<Response> postSender(Sender sender) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(sender.toJson());
    Response response = await post(POST_SHIPPER, headers: headers, body: json);
    return response;
  }

  Future<Response> getSenderByPhoneNum(String phone) async {
    return http.get(GET_SHIPPER_BY_PHONE + phone);
  }

  Future<Sender> convertJsonToSender(http.Response response) async {
    Sender sender = Sender.fromJson(jsonDecode(response.body));
    return sender;
  }

  Future<bool> isExistAccountByEmail(String email) async {
    http.Response response = await http.get(GET_ACCOUNT_BY_EMAIL + email);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> isExistAccountByPhone(String phone) async {
    http.Response response = await http.get(GET_ACCOUNT_BY_EMAIL + phone);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
  
  Future<double> getBalance(String walletId) async {
    Response response = await http.get(GET_WALLET_BY_WALLETID + walletId);
    if (response.statusCode == 200) {
      Wallet wallet = Wallet.fromJson(jsonDecode(response.body));
      return wallet.amount;
    }
    return 0;
  } 
}