
import 'package:delivery_app_shipper_shipper/Src/configs/constants.dart';
import 'package:delivery_app_shipper_shipper/Src/models/Product.dart';
import 'package:delivery_app_shipper_shipper/Src/models/history_model.dart';
import 'package:delivery_app_shipper_shipper/Src/resources/Widgets/delivery_history_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../api_util/history.dart';
import '../../blocs/shared_preferences.dart';
import '../../models/transaction.dart';
import '../../models/transaction_detail.dart';
import 'booking_detail.dart';

class HistoryPage extends StatefulWidget {
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
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  SaveData save = new SaveData();

  HistoryApi api = new HistoryApi();

  Future<List<History_Model>> getListTransaction() async {
    String shipperId = await save.getId();
    print(shipperId);
    Response response = await api.getTransactionByShipperID(shipperId);
    List<Transaction> list = await api.convertJsonToListTransaction(response);
    List<Transaction> listTransactionTypeSending =
    await api.getListTransactionTypeSending(list);
    list.clear();
    List<History_Model> listHistoryModel = List();
    for (int i = 0; i < listTransactionTypeSending.length; i++) {
      Response json = await api.getTransactionDetailByID(
          listTransactionTypeSending[i].transactionDetailsId.toString());
      print(json.body);
      TransactionDetail transactionDetail =
      await api.convertJsonToTransactionDetail(json);
      print(transactionDetail.transactionDetailsId.toString() +
          transactionDetail.receiverAddress);
      listHistoryModel.add(new History_Model(
          listTransactionTypeSending[i].type,
          transactionDetail.senderAddress,
          transactionDetail.receiverAddress,
          transactionDetail.useTime,
          transactionDetail.status,
          transactionDetail.amount));
    }
    listTransactionTypeSending.clear();
    return listHistoryModel;
  }

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
            child: FutureBuilder<List<History_Model>>(
              future: getListTransaction(),
              initialData: [],
              builder: (BuildContext context,
                  AsyncSnapshot<List<History_Model>> snapshot) =>
                  GridView.builder(
                    itemCount: (snapshot.data != null) ? snapshot.data.length : 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      // mainAxisSpacing: kDefaultPaddin,
                      crossAxisSpacing: kDefaultPaddin,
                      childAspectRatio: 4,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      history: snapshot.data[index],
                      // press: () => Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => BookingDetailPage(
                      //         history: snapshot.data[index],
                      //       ),
                      //     )),
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
