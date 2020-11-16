
import 'dart:convert';

import 'package:delivery_app_shipper_shipper/Src/blocs/shared_preferences.dart';
import 'package:delivery_app_shipper_shipper/Src/configs/link.dart';
import 'package:delivery_app_shipper_shipper/Src/models/account.dart';
import 'package:delivery_app_shipper_shipper/Src/models/sender.dart';
import 'package:delivery_app_shipper_shipper/Src/models/shipper.dart';
import 'package:delivery_app_shipper_shipper/Src/models/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../configs/link.dart';

class LoginBloc{
  final codeController = new TextEditingController();
  SaveData save = new SaveData();


  Future<String> getAccountRole(Response response) async {
    final responseResult = response;
    if (responseResult.statusCode == 200) {
      Account account =  Account.fromJson(jsonDecode(responseResult.body));
      if (account.role.compareTo("shipper") == 0) {
        if (account.status == null){
          return "not exist";
        }
        if (account.status.compareTo("deactive") == 0) {
          return "deactive";
        }
        if (account.status.compareTo("active") == 0) {
          save.saveAccount(account);
          return "success";
        }
      } else {
        return "fail";
      }
    }
    return null;
  }

  Future<String> getBalance(Wallet wallet) async {
    return wallet.walletId;
  }

  Future<Wallet> convertJsonToWallet(Response response) async {
    Wallet wallet = Wallet.fromJson(jsonDecode(response.body));
    return wallet;
  }

  Future<Shipper> convertJsonToShipper(Response response) async {
    Shipper shipper = Shipper.fromJson(jsonDecode(response.body));
    return shipper;
  }

  Future<Account> convertJsonToAccount(http.Response response) async {
    Account account = Account.fromJson(jsonDecode(response.body));
    return account;
  }

  Future<http.Response> getShipperJsonByPhone(String phone) async {
    return http.get(GET_SHIPPER_BY_PHONE + phone);
  }

  Future<http.Response> getAccountJsonByEmail(String email) async {
    return http.get(GET_ACCOUNT_BY_EMAIL + email);
  }

  Future<http.Response> getAccountJsonByPhone(String phone) async {
    return http.get(GET_ACCOUNT_BY_PHONE + phone);
  }

  Future<http.Response> getWalletByWalletID(String walletId) async {
    return http.get(GET_WALLET_BY_WALLETID + walletId);
  }

}