import 'package:delivery_app_shipper_shipper/Src/api_util/home.dart';
import 'package:delivery_app_shipper_shipper/Src/configs/constants.dart';
import 'package:delivery_app_shipper_shipper/Src/models/transaction_detail.dart';
import 'package:delivery_app_shipper_shipper/Src/resources/Widgets/request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:delivery_app_shipper_shipper/Src/blocs/shared_preferences.dart';
import 'package:delivery_app_shipper_shipper/Src/models/transaction.dart';

const LatLng MY_LOCATION = LatLng(10.8419144, 106.8098611);
const LatLng FIRST_LOCATION = LatLng(10.835691, 106.807665);
const LatLng SECOND_LOCATION = LatLng(10.835452, 106.814569);
const LatLng THIRD_LOCATION = LatLng(10.848947, 106.806134);

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyMapsState();
  }
}

class MyMapsState extends State<HomePage> {
  Set<Polyline> _polylines = {};
  double mylat = 0;
  double mylng = 0;
  PolylinePoints polylinePoints = PolylinePoints();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  LatLng _initialcameraposition = LatLng(10.835691, 106.807665);
  GoogleMapController _controller;
  List<LatLng> polylineCoordinates = [];
  Location _location = Location();
  Set<Marker> _markers = {};
  double _pinPillPosition = 0;
  String googleAPIKey = "AIzaSyBDJpX-xIqijJq2wLy3sP5lug3LSpYngbo";
  bool statusconfirm = false;
  HomeApi api = new HomeApi();

  BitmapDescriptor destinationIcon;
  BitmapDescriptor destinationIcon1;

  Future<List<TransactionDetail>> getListTransactionDetail() async {
    Response response = await api.getListTransactionDetailUnFinished();
    List<TransactionDetail> list = List();
    if (response.statusCode == 200) {
      list = await api.convertJsonToListTransactionDetail(response);
    }
    return list;
  }

  void setSourceAndDestinationIcons() async {
    destinationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 3, size: Size(300, 300)),
      'assets/driving_pin.png',
    );
    destinationIcon1 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 3, size: Size(300, 300)),
        'assets/locationpin2.png');
  }

  void setMapPins() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('destPin'),
        position: MY_LOCATION,
      ));
    });
  }

  @override
  void initState() {
    super.initState();

    setSourceAndDestinationIcons();
    setMapPins();
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;

    print(_location.getLocation().toString());
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(MY_LOCATION.latitude, MY_LOCATION.longitude),
            zoom: 15)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              polylines: _polylines,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              markers: _markers,
              // myLocationButtonEnabled : true,
              onTap: (LatLng location) {
                setState(() {
                  _pinPillPosition = -500;
                });
              },
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                children: <Widget>[],
              ),
            ),
            AnimatedPositioned(
              bottom: _pinPillPosition,
              right: 0,
              left: 0,
              duration: Duration(milliseconds: 200),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 330,
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x88999999),
                          offset: Offset(0, 5),
                          blurRadius: 5.0,
                        ),
                      ]),
                  // padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: FutureBuilder<List<TransactionDetail>>(
                    future: getListTransactionDetail(),
                    initialData: [],
                    builder: (BuildContext context,
                            AsyncSnapshot<List<TransactionDetail>> snapshot) =>
                        GridView.builder(
                            itemCount: (snapshot.data != null) ? snapshot.data.length : 0,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              // mainAxisSpacing: kDefaultPaddin,
                              crossAxisSpacing: kDefaultPaddin,
                              childAspectRatio: 4,
                            ),
                            itemBuilder: (context, index) => RequestCard(
                                transactionDetail: snapshot.data[index],
                                press: () {
                                  onPlaceSelected();
                                  setState(() {
                                    _pinPillPosition = -500;
                                  });
                                })),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: kPrimaryColor,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.15,
          child: bottombutton()
          // FlatButton(
          //   child: Text('Get request'),
          //   onPressed: (){
          //     setState(() {
          //       _pinPillPosition = 0;
          //     });
          //   },
          // ),
          ),
    );
  }

  void _addMarker() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('destPin1'),
          position: SECOND_LOCATION,
          icon: destinationIcon,
          onTap: () {
            setState(() {
              _pinPillPosition = 0;
            });
          }));
      _markers.add(Marker(
          markerId: MarkerId('destPin2'),
          position: THIRD_LOCATION,
          icon: destinationIcon,
          onTap: () {
            setState(() {
              _pinPillPosition = 0;
            });
          }));
    });
  }

  Widget bottombutton() {
    if (statusconfirm) {
      return FlatButton(
        child: Text('Get request'),
        onPressed: () {
          setState(() {
            _pinPillPosition = 0;
            statusconfirm = false;
          });
        },
      );
    } else {
      return FlatButton(
        child: Text('Done'),
        onPressed: () {
          setState(() {
            _pinPillPosition = -500;
            statusconfirm = true;
          });
        },
      );
    }
  }

  Future<void> onClickedDone() async {
    SaveData save = new SaveData();
    int transactionDetailID = await save.getTransactionDetailsId();
    String pickedTime = await save.getPickedTime();
    var date = new DateTime.now().toString();
    TransactionDetail model = new TransactionDetail.n(transactionDetailID, pickedTime, date, "Finish");
    Response response = await api.doneTransaction(model);
    if (response.statusCode == 200) {
      String shipperId = await save.getId();
      Transaction transaction = new Transaction.n(transactionDetailID, shipperId);
      await api.updateTransaction(transaction);
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Failed'),
            content: Text('Cannot accept'),
            actions: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void onPlaceSelected() {
    _addMarker();
    setPolylines();
  }

  setPolylines() async {
    List<PointLatLng> result1 =
        await polylinePoints?.getRouteBetweenCoordinates(
            googleAPIKey,
            MY_LOCATION.latitude,
            MY_LOCATION.longitude,
            THIRD_LOCATION.latitude,
            THIRD_LOCATION.longitude);
    List<PointLatLng> result = await polylinePoints?.getRouteBetweenCoordinates(
        googleAPIKey,
        THIRD_LOCATION.latitude,
        THIRD_LOCATION.longitude,
        SECOND_LOCATION.latitude,
        SECOND_LOCATION.longitude);
    if (result1.isNotEmpty) {
      result1.forEach((PointLatLng point1) {
        polylineCoordinates.add(LatLng(point1.latitude, point1.longitude));
      });
    }
    if (result.isNotEmpty) {
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly1"),
          color: Color.fromARGB(255, 40, 122, 198),
          width: 3,
          points: polylineCoordinates);

      Polyline polyline1 = Polyline(
          polylineId: PolylineId("poly"),
          color: Color.fromARGB(255, 40, 122, 198),
          width: 3,
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
      _polylines.add(polyline1);
    });
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
