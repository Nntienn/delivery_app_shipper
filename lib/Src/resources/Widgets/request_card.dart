import 'package:delivery_app_shipper_shipper/Src/models/Product.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final Product product;
  final Function press;

  const RequestCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text('Sender:'),
                Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 22, 0),
                  child: Text(
                    'Price',//thay bằng số tiền
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),//đoạn này cộng chuỗi lấy điểm gửi
            Text('From:'),//đoạn này cộng chuỗi lấy điểm nhận
            Text('Receiver:'),//Đoạn này cộng chuỗi lấy thời gian gửi
            Row(
              children: [
                Text('To'),
                Spacer(),
                Container(height: 18,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    
                    child: FlatButton(
                      child: Text('Accept', textAlign: TextAlign.end,style: TextStyle(color: Colors.white, fontSize: 13),),
                    ),
                  ),
                )

              ],
            ),
            SizedBox(
              height: 14,
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

