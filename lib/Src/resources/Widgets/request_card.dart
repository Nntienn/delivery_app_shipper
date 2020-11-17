
import 'package:delivery_app_shipper_shipper/Src/api_util/request_card_api.dart';
import 'package:delivery_app_shipper_shipper/Src/models/transaction_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:delivery_app_shipper_shipper/Src/blocs/shared_preferences.dart';

class RequestCard extends StatefulWidget {
  final TransactionDetail transactionDetail;
  final Function press;

  const RequestCard({
    Key key,
    this.transactionDetail,
    this.press,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RequestStrate(transactionDetail, press);
  }
}

class RequestStrate extends State<RequestCard>{
  TransactionDetail transactionDetail;
  Function press;
  RequestStrate(this.transactionDetail,  this.press);
  @override
  Widget build(BuildContext context) {
    RequestCartApi api = new RequestCartApi();
    SaveData save = new SaveData();

    Future<void> onClickAccept(String status) async {
      var date = new DateTime.now().toString();
      TransactionDetail model = new TransactionDetail.n(transactionDetail.transactionDetailsId, date, date, status);
      Response response = await api.acceptSending(model);
      if (response.statusCode != 200) {
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
      } else {
        save.saveTransactionDetail(model);
      }
    }

    return GestureDetector(
      onTap: press,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text('Receiver: ' + transactionDetail.receiverName, overflow: TextOverflow.ellipsis,),
                Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 22, 0),
                  child: Text(
                    transactionDetail.amount.toStringAsFixed(3),//thay bằng số tiền
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),//đoạn này cộng chuỗi lấy điểm gửi
            Text('From:' + transactionDetail.senderAddress, overflow: TextOverflow.ellipsis),//đoạn này cộng chuỗi lấy điểm nhận
            Text('Phone: ' + transactionDetail.receiverPhoneNum),//Đoạn này cộng chuỗi lấy thời gian gửi
            Text('To: ' + transactionDetail.receiverAddress, overflow: TextOverflow.ellipsis),
            Row(
              children: [
                Text('Distance: ' + transactionDetail.distance.toString()),
                Spacer(),
                Container(height: 18,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),

                    child: FlatButton(
                      onPressed: () {
                        onClickAccept("Sending");
                      },
                      child: Text('Accept', textAlign: TextAlign.end,style: TextStyle(color: Colors.white, fontSize: 13),),
                    ),
                  ),
                )

              ],
            ),
            SizedBox(
              height: 1,
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            // SizedBox(
            //   height: 5,
            // ),
          ],
        ),
      ),
    );
  }
}

