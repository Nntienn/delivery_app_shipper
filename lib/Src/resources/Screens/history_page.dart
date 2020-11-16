
import 'package:delivery_app_shipper_shipper/Src/configs/constants.dart';
import 'package:delivery_app_shipper_shipper/Src/models/Product.dart';
import 'package:delivery_app_shipper_shipper/Src/resources/Widgets/delivery_history_card.dart';
import 'package:flutter/material.dart';

import 'booking_detail.dart';

class HistoryPage extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Column(
  //       children: [
  //         Container(
  //           decoration: BoxDecoration(color: Colors.white, boxShadow: [
  //             BoxShadow(
  //               color: Color(0x88999999),
  //               offset: Offset(0, 5),
  //               blurRadius: 5.0,
  //             ),
  //           ]),
  //           margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
  //           child: Column(
  //             children: [
  //               Container(
  //                   margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
  //                   child: Text(
  //                     'Người gửi',
  //                     style: TextStyle(
  //                         color: Colors.black38,
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.bold),
  //                   )),
  //               Container(
  //                 margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Container(
  //                       margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
  //                       child: Text(
  //                         'Nguyen Thai Binh',
  //                         style: TextStyle(
  //                             fontSize: 17, fontWeight: FontWeight.bold),
  //                       ),
  //                     ),
  //                     Container(
  //                       margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
  //                       child: Text(
  //                         '|',
  //                         style: TextStyle(
  //                             fontSize: 17, fontWeight: FontWeight.bold),
  //                       ),
  //                     ),
  //                     Container(
  //                       margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
  //                       child: Text(
  //                         '+84854146162',
  //                         style: TextStyle(
  //                             fontSize: 17, fontWeight: FontWeight.bold),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     SizedBox(
  //                       width: MediaQuery.of(context).size.width * 0.85,
  //                       child: Text(
  //                         '9A2 Đường Man Thiện, Hiệp Phú, Quận 9,Thành Phố Hồ Chí Minh',
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         Container(
  //           // decoration: BoxDecoration(color: Colors.white,
  //           //     // borderRadius: BorderRadius.all(Radius.circular(10)),
  //           //     boxShadow: [
  //           //       BoxShadow(
  //           //         color: Color(0x88999999),
  //           //         offset: Offset(0, 5),
  //           //         blurRadius: 5.0,
  //           //       ),
  //           //     ]),
  //           // margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
  //           child: Column(
  //             children: [
  //               Expanded(
  //                 child: Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
  //                   child: GridView.builder(
  //                       itemCount: products.length,
  //                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                         crossAxisCount: 1,
  //                         mainAxisSpacing: kDefaultPaddin,
  //                         crossAxisSpacing: kDefaultPaddin,
  //                         childAspectRatio: 0.75,
  //                       ),
  //                       itemBuilder: (context, index) => ItemCard(
  //                         product: products[index],
  //                         // press: () => Navigator.push(
  //                         //     context,
  //                         //     MaterialPageRoute(
  //                         //       builder: (context) => DetailsScreen(
  //                         //         product: products[index],
  //                         //       ),
  //                         //     )),
  //                       )),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           decoration: BoxDecoration(color: Colors.white, boxShadow: [
  //             BoxShadow(
  //               color: Color(0x88999999),
  //               offset: Offset(0, 5),
  //               blurRadius: 5.0,
  //             ),
  //           ]),
  //           margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
  //           height: 60,
  //           child: Column(
  //             children: [
  //               Container(
  //                 color: kPrimaryColor,
  //                 height: 60,
  //                 width: MediaQuery.of(context).size.width,
  //                 child: FlatButton(
  //                   onPressed: () {},
  //                   // => Navigator.push(
  //                   //     context, MaterialPageRoute(builder: (context) => ())),
  //                   color: kPrimaryColor,
  //                   child: Text(
  //                     'Continue',
  //                     style: TextStyle(fontSize: 20, color: Colors.white),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            "Booking History",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),

        Expanded(
          child: Container(
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
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  // mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 4,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: products[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingDetailPage(
                          product: products[index],
                        ),
                      )),
                )),
          ),
        ),
      ],
    );
  }
}
