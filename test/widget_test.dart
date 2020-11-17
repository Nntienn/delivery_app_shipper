// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:delivery_app_shipper_shipper/Src/api_util/home.dart';
import 'package:delivery_app_shipper_shipper/Src/app.dart';
import 'package:delivery_app_shipper_shipper/Src/models/transaction_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:delivery_app_shipper_shipper/Src/api_util/request_card_api.dart';
import 'package:delivery_app_shipper_shipper/main.dart';
import 'package:http/http.dart';

Future<void> main() async {
  RequestCartApi api = new RequestCartApi();
  var date = new DateTime.now().toString();
  TransactionDetail model = new TransactionDetail.n(10, date, date, "UnFinished");
  Response response = await api.acceptSending(model);
  print(response.statusCode);
}
