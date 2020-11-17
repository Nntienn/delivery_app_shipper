

import 'package:delivery_app_shipper_shipper/Src/models/history_model.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final History_Model history;
  final Function press;

  const ItemCard({
    Key key,
    this.history,
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
                Text('From:'),
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
            Text('To:'),//đoạn này cộng chuỗi lấy điểm nhận
            Text('At:'),//Đoạn này cộng chuỗi lấy thời gian gửi
            Row(
              children: [
                Text('Decription'),
                Spacer(),
                Container(height: 18,
                  child: FlatButton(
                    child: Text('detail', textAlign: TextAlign.end,style: TextStyle(color: Colors.redAccent, fontSize: 13),),
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
