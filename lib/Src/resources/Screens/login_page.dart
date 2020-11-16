
import 'package:delivery_app_shipper_shipper/Src/blocs/login_bloc.dart';
import 'package:delivery_app_shipper_shipper/Src/blocs/shared_preferences.dart';
import 'package:delivery_app_shipper_shipper/Src/blocs/validation_bloc.dart';
import 'package:delivery_app_shipper_shipper/Src/models/account.dart';
import 'package:delivery_app_shipper_shipper/Src/models/sender.dart';
import 'package:delivery_app_shipper_shipper/Src/models/wallet.dart';
import 'package:delivery_app_shipper_shipper/Src/resources/Widgets/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'main_page.dart';
import 'register_page.dart';

final phoneNumberController = TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ValidationBloc _validationBloc = new ValidationBloc();
  final LoginBloc _loginBloc = new LoginBloc();
  TextEditingController _codeController = new TextEditingController();


  Future<void> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text,
        timeout: Duration(seconds: 120),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();
          UserCredential result = await _auth.signInWithCredential(credential);

          auth.User user = result.user;

          if (user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          } else {
            print('Error');
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print('$exception');
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text('Give the code'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Confirm'),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId, smsCode: code);

                        UserCredential result =
                            await _auth.signInWithCredential(credential);
                        auth.User user = result.user;
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()));
                        } else {
                          print('Error');
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // FlutterLogo(size: 150),
              Image.asset('assets/Logo.jpg'),
              SizedBox(height: 50),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: StreamBuilder(
                    stream: _validationBloc.phoneNumberStream,
                    builder: (context, snapshot) => TextField(
                      keyboardType: TextInputType.number,
                      controller: phoneNumberController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error : null,
                          labelText: "Phone Number",
                          prefixIcon:
                              Container(width: 50, child: Icon(Icons.phone)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffCED0D2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)))),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: _onLoginClick,
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Color(0xff3277D8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ),
              ),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          _onLoginWithGoogleClick(result.email);
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onLoginWithGoogleClick(String email) async {
    Response response = await _loginBloc.getAccountJsonByEmail(email);
    if (response.statusCode == 200) {
      String checkRole = await _loginBloc.getAccountRole(response);
      if (checkRole.compareTo("success") == 0) {
        Account account = await _loginBloc.convertJsonToAccount(response);
        Response senderResponse = await _loginBloc.getSenderJsonByPhone(account.phoneNum);
        Sender sender = await _loginBloc.convertJsonToSender(senderResponse);
        SaveData save = new SaveData();
        save.saveSender(sender);
        Response walletResponse = await _loginBloc.getWalletByWalletID(sender.walletId);
        Wallet wallet = await _loginBloc.convertJsonToWallet(walletResponse);
        save.saveBalance(wallet.amount);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      } else if (checkRole.compareTo("fail") == 0) {
        _validationBloc.setPhoneNumberControllerError(
            "This phone number is registered in a different role.");
      } else if (checkRole.compareTo("deactive") == 0) {
        _errAlert(context, "Account is locked active");
      } else if(checkRole.compareTo("not exist") == 0) {
        _errAlert(context, "Account doesn't exist");
      }
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterPage()));
    }
  }

  Future<void> _onLoginClick() async {
    if (_validationBloc.isValidLogIn(phoneNumberController.text)) {
      Response response =
      await _loginBloc.getAccountJsonByPhone(phoneNumberController.text);
      if (response.statusCode == 200) {
        String checkRole = await _loginBloc.getAccountRole(response);
        if (checkRole.compareTo("success") == 0) {
          Response senderResponse = await _loginBloc.getSenderJsonByPhone(phoneNumberController.text);
          Sender sender = await _loginBloc.convertJsonToSender(senderResponse);
          SaveData save = new SaveData();
          save.saveSender(sender);
          Response walletResponse = await _loginBloc.getWalletByWalletID(sender.walletId);
          Wallet wallet = await _loginBloc.convertJsonToWallet(walletResponse);
          save.saveBalance(wallet.amount);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        } else if (checkRole.compareTo("fail") == 0) {
          _validationBloc.setPhoneNumberControllerError(
              "This phone number is registered in a different role.");
        } else if(checkRole.compareTo("deactive") == 0) {
          _errAlert(context, "Account is locked active");
        } else if(checkRole.compareTo("not exist") == 0) {
          _errAlert(context, "Account doesn't exist");
        }
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      }
    }
  }

  Future _errAlert(BuildContext context, String err) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Failed login'),
          content: Text('$err'),
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
