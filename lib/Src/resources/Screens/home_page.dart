import 'package:delivery_app_shipper_shipper/Src/configs/constants.dart';
import 'package:delivery_app_shipper_shipper/Src/models/Product.dart';
import 'package:delivery_app_shipper_shipper/Src/resources/Widgets/delivery_history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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
  double mylat = 0;
  double mylng = 0;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  LatLng _initialcameraposition = LatLng(10.835691, 106.807665);
  GoogleMapController _controller;
  Location _location = Location();
  int _currentIndex = 1;
  Set<Marker> _markers = {};
  double _pinPillPosition = -500;

  BitmapDescriptor destinationIcon;
  BitmapDescriptor destinationIcon1;

  void setSourceAndDestinationIcons() async {
    destinationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 3, size: Size(300, 300)),
      'assets/driving_pin.png',
    );
    destinationIcon1 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 3, size: Size(300, 300)),
        'assets/locationpin2.png');
  }

  @override
  void initState() {
    super.initState();
    setSourceAndDestinationIcons();
  }

  void setMapPins() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('myLocation'),
          position: SECOND_LOCATION,
          icon: destinationIcon1,
          onTap: () {
            setState(() {
              _pinPillPosition = 0;
            });
          }));
    });
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    setMapPins();
    _controller = _cntlr;

    print(_location.getLocation().toString());
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15)),
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
                children: <Widget>[
                ],
              ),
            ),
            AnimatedPositioned(
              bottom: _pinPillPosition,
              right: 0,
              left: 0,
              duration: Duration(milliseconds: 200),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Expanded(
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
                    child: GridView.builder(
                        itemCount: 3,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          // mainAxisSpacing: kDefaultPaddin,
                          crossAxisSpacing: kDefaultPaddin,
                          childAspectRatio: 4,
                        ),
                        itemBuilder: (context, index) => ItemCard(
                          product: products[index],
                          press: (){},
                          // => Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => BookingDetailPage(
                          //         product: products[index],
                          //       ),
                          //     )),
                        )),
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
        child: FlatButton(
          child: Text('Get request'),
          onPressed: (){
            setState(() {
              _pinPillPosition = 0;
            });
          },
        ),
      ),
    );
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
