import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:delivery_app_shipper_shipper/Src/blocs/home_bloc.dart';
import 'package:delivery_app_shipper_shipper/Src/blocs/shared_preferences.dart';
import 'package:delivery_app_shipper_shipper/Src/configs/constants.dart';
import 'package:delivery_app_shipper_shipper/Src/models/place_item_res.dart';
import 'package:delivery_app_shipper_shipper/Src/models/trip_info_res.dart';
import 'package:delivery_app_shipper_shipper/Src/repository/place_service.dart';


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Loading.dart';
import 'checkout_page.dart';




class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomeState();
  }

}
class _MyHomeState extends State<HomePage>{
  var _tripDistance = 0;
  double MyDistance = 0;
  final Map<String, Marker> _markers = <String, Marker>{};
  HomeBloc _homeBloc = new HomeBloc();
  SaveData _save = new SaveData();
  String _address;
  TextEditingController addressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color(0x88999999),
                  offset: Offset(0, 5),
                  blurRadius: 5.0,
                ),
              ]),
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text(
                        'Người gửi',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: FutureBuilder(
                            future: _save.getName(),
                            builder: (BuildContext context, AsyncSnapshot<String> snapshot) => Text(
                              snapshot.hasData ? snapshot.data : "Loading",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Text(
                            '|',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: FutureBuilder(
                            future: _save.getPhoneNum(),
                            builder: (BuildContext context, AsyncSnapshot<String> snapshot) => Text(
                              snapshot.hasData ? snapshot.data : "fail",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //     margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  //     child: TextField(
                  //       cursorColor: Colors.black26,
                  //       style: TextStyle(fontSize: 15),
                  //       controller: addressController,
                  //       decoration: InputDecoration(
                  //         hintText: "Enter other address",
                  //         contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                  //         // enabledBorder: UnderlineInputBorder(
                  //         //   borderSide: BorderSide(color: Colors.black26),
                  //         // ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.black26),
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(20.0)),
                  //         ),
                  //         border: OutlineInputBorder(
                  //           // width: 0.0 produces a thin "hairline" border
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(20.0)),
                  //           borderSide: BorderSide(color: Colors.white24),
                  //           //borderSide: const BorderSide(),
                  //         ),
                  //       ),
                  //     ),
                  // ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 10, 0, 10),
                    child: CustomRadioButton(
                      // horizontal: true,
                      enableShape: true,
                      elevation: 0,
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables: [
                        'Nhà',
                        'Cơ quan',
                        'Nơi khác',
                      ],
                      buttonValues: [
                        1,
                        2,
                        3,
                      ],
                      defaultSelected: 1,
                      radioButtonValue: (value) {
                        setAddressData(value);
                      },
                      // cai nay de add action
                      selectedColor: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white,
                  // borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x88999999),
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                    ),
                  ]),
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text(
                        'Thông tin người nhận',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          'Họ và tên',
                          style: TextStyle(color: Colors.black38, fontSize: 17),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TextField(
                        cursorColor: Colors.black26,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.black26),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                          ),
                          border: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide(color: Colors.white24),
                            //borderSide: const BorderSide(),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          'Địa chỉ',
                          style: TextStyle(color: Colors.black38, fontSize: 17),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //     margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  //     child: TextField(
                  //       cursorColor: Colors.black26,
                  //       decoration: InputDecoration(
                  //         contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                  //         // enabledBorder: UnderlineInputBorder(
                  //         //   borderSide: BorderSide(color: Colors.black26),
                  //         // ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.black26),
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(90.0)),
                  //         ),
                  //         border: OutlineInputBorder(
                  //           // width: 0.0 produces a thin "hairline" border
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(90.0)),
                  //           borderSide: BorderSide(color: Colors.white24),
                  //           //borderSide: const BorderSide(),
                  //         ),
                  //       ),
                  //     )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          'Số điện thoại',
                          style: TextStyle(color: Colors.black38, fontSize: 17),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black26,
                        cursorRadius: Radius.circular(5.0),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.black26),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                          ),
                          border: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide(color: Colors.white24),
                            //borderSide: const BorderSide(),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Text(
                          'Thu hộ/ COD',
                          style: TextStyle(color: Colors.black38, fontSize: 17),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        child: Text(
                          '*(tùy chọn)',
                          style: TextStyle(color: Colors.black38, fontSize: 13),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black26,
                        cursorRadius: Radius.circular(5.0),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.black26),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                          ),
                          border: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderRadius:
                            BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide(color: Colors.white24),
                            //borderSide: const BorderSide(),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color(0x88999999),
                  offset: Offset(0, 5),
                  blurRadius: 5.0,
                ),
              ]),
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              height: 60,
              child: Column(
                children: [
                  Container(
                    color: kPrimaryColor,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      onPressed: () {
                        print("$MyDistance");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutPage(MyDistance : MyDistance),
                          ),
                        );
                      },
                      // => Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) => ())),
                      color: kPrimaryColor,
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setAddressData(int opt) async {
    String _homeAddress = await _save.getHomeAddress();
    String _officeAddress = await _save.getWorkAddress();
    String _otherAddress = addressController.text;
    switch (opt) {
      case 1: _address = _homeAddress; break;
      case 2: _address = _officeAddress; break;
      case 3: _address = _otherAddress; break;
    }
  }
  void _addMarker(String mkId, PlaceItemRes place) async {
    _markers[mkId] = Marker(markerId: MarkerId(mkId),position: LatLng(place.lat, place.lng)
    );
  }
  void onPlaceSelected(PlaceItemRes place, bool fromAddress) {
    var mkId = fromAddress ? "from_address" : "to_address";
    _addMarker(mkId, place);
    _checkDrawPolyline();
  }

  void _checkDrawPolyline() {
    if (_markers.length > 1) {
      var from = _markers["from_address"].position;
      var to = _markers["to_address"].position;
      PlaceService.getStep(
          from.latitude, from.longitude, to.latitude, to.longitude)
          .then((vl) {
        TripInfoRes infoRes = vl;
        _tripDistance = infoRes.distance;
        print("$_tripDistance" + " meter");
        print("$MyDistance" + " km aha");
        setState(() {
          MyDistance = _tripDistance/1000 as double ;
        });
        print("$MyDistance" + " km");
//        print(paths);
      });
    }
  }
}