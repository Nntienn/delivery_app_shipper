
import 'package:delivery_app_shipper_shipper/Src/blocs/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'main_page.dart';



String nameLoading = "";
String phoneNumLoading = "";
String homeAddressLoading = "";
String idLoading = "";
String workAddressLoading = "";
String walletIdLoading = "";
double balanceLoading = 0;

void getSender() async {
  SaveData save = new SaveData();
  nameLoading = await save.getName();
  phoneNumLoading = await save.getPhoneNum();
  homeAddressLoading = await save.getHomeAddress();
  workAddressLoading = await save.getWorkAddress();
  idLoading = await save.getId();
  walletIdLoading = await save.getWalletId();
  balanceLoading = await save.getBalance();
}
class LoadingPage extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<LoadingPage> {

  @override
  Widget build(BuildContext context) {

    return new SplashScreen(
      routeName: "/",
      title: new Text(
        'Welcome In SplashScreen',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      seconds: 2,
      navigateAfterSeconds: MainPage(),
      image: new Image.asset(
          'assets/loading.gif'),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Colors.white,
    );
  }
}
