
import 'package:delivery_app_shipper_shipper/Src/configs/constants.dart';
import 'package:delivery_app_shipper_shipper/Src/models/Product.dart';
import 'package:flutter/material.dart';

class BookingDetailPage extends StatelessWidget{
  //thay cai product bang transaction detail
  Product product;
  BookingDetailPage({this.product});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        title: Text(
          "Delivery App",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

}