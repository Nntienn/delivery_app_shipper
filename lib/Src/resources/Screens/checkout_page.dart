
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget{
  double MyDistance;
  CheckoutPage({this.MyDistance});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CheckoutState(MyDistance);
  }
}
class CheckoutState extends State<CheckoutPage>{
  double MyDistance;
  CheckoutState(this.MyDistance);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Center(
        child: Text("$MyDistance"),
      ),
    );
  }
}


