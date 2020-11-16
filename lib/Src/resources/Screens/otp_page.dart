
import 'package:delivery_app_shipper_shipper/Src/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'main_page.dart';


class OtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _verificationId = new TextEditingController();
    //final _codeController = TextEditingController();

    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 *2;

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              AppBar(
                toolbarHeight: 70,
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: Text(
                  'Verification',
                  style: TextStyle(color: Colors.black),
                ),
                // leading: FlatButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => RegisterPage()),
                //       );
                //     },
                //     child: Icon(
                //       Icons.arrow_back_ios,
                //       color: Colors.black,
                //     )),
              ),
              Container(
                height: 5,
                color: kPrimaryLightColor,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Column(
                  children: [
                    // Icon(Icons.account_circle),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20, 30, 10, 20),
                        child: Text(
                          'Enter verification code we have sent on given number',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 22, 10, 0),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            controller: _verificationId,
                            style: TextStyle(fontSize: 25, color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "ENTER VERIFICATION CODE",
                              labelStyle: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          )),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 122,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 0, 14),
                  child:
                  CountdownTimer(
                    endTime: endTime,
                    widgetBuilder: (_, CurrentRemainingTime time) {
                      if(time == null) {
                        return Text('00:00',style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold),);
                      }else if(time.min == null){
                        return Text(
                            '00:${time.sec}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);
                      }
                      return Text(
                          '${time.min}:${time.sec}',style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold),);
                    },
                  ),
                ),
                Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 0, 14),
                  child: FlatButton(
                    onPressed:() => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => OtpPage())),
                    color: Colors.white,
                    child: Text('Resend', style: TextStyle(color: kPrimaryColor, fontSize: 20),),
                  ),
                )
              ],
            ),
            Container(
              // padding: EdgeInsets.all(12),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MainPage()));
                },
                color: kPrimaryColor,
                textColor: Colors.white,
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
