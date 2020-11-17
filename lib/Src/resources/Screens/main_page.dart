
import 'package:delivery_app_shipper_shipper/Src/configs/constants.dart';
import 'package:delivery_app_shipper_shipper/Src/resources/Screens/wallet_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'history_page.dart';
//import 'home_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPageState();
  }
}

class MyPageState extends State<MainPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  bool btopleft = false;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    WalletPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        title: Text(
          "Delivery App",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          // Image.asset("assets/ic_notify.png"),
          topleft(),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Feather.home,
              color: kGoodLightGray,
            ),
            // ignore: deprecated_member_use
            title: Text('HOME'),
            activeIcon: Icon(
              Feather.home,
              color: Colors.lightBlueAccent,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              AntDesign.wallet,
              color: kGoodLightGray,
            ),
            // ignore: deprecated_member_use
            title: Text('WALLET'),
            activeIcon: Icon(
              AntDesign.wallet,
              color: Colors.lightBlueAccent,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.history,
              color: kGoodLightGray,
            ),
            // ignore: deprecated_member_use
            title: Text('CALENDAR'),
            activeIcon: Icon(
              FontAwesome.history,
              color: Colors.lightBlueAccent,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: kGoodLightGray,
              size: 36,
            ),
            // ignore: deprecated_member_use
            title: Text('PROFILE'),
            activeIcon: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.lightBlueAccent,
              size: 36,
            ),
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            setState(() {
              btopleft = true;
            });
            ;
          } else {
            setState(() {
              btopleft = false;
            });
          }
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget topleft() {
    if (btopleft) {
      return Container(
          width: 120,
          child: FlatButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PriceListPage()),
              // );
            },
            child: Text(
              'Withdraw',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  decoration: TextDecoration.underline),
            ),
          ));
    } else {
      return Container(
        width: 120,
        child: FlatButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0)), //this right here
                    child: Container(
                      height: 210,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Price List',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Row(children: [
                              Text('2km đầu tiên(*)'),
                              Spacer(),
                              Text(
                                '14.500 đ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                            Row(children: [
                              Text('1km tiếp theo'),
                              Spacer(),
                              Text(
                                '5.5000 đ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                            Row(children: [
                              Text('200k COD đầu tiên(**)'),
                              Spacer(),
                              Text(
                                '0 đ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                            Row(children: [
                              Text('201k - 500k COD'),
                              Spacer(),
                              Text(
                                '5.500 đ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('(*) Giá tối thiểu'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('(**)COD: Số tiền thu hộ'),
                              ],
                            ),
                            SizedBox(
                              width: 320.0,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Quay Lại",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.redAccent,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          child: Text(
            'Price List',
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                decoration: TextDecoration.underline),
          ),
        ),
        margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
      );
    }
  }

  myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1,
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //         <--- border radius here
          ),
    );
  }
}
