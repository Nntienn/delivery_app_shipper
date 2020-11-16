
import 'package:delivery_app_shipper_shipper/Src/api_util/register.dart';
import 'package:delivery_app_shipper_shipper/Src/blocs/register_bloc.dart';
import 'package:delivery_app_shipper_shipper/Src/blocs/shared_preferences.dart';
import 'package:delivery_app_shipper_shipper/Src/configs/constants.dart';
import 'package:delivery_app_shipper_shipper/Src/models/account.dart';
import 'package:delivery_app_shipper_shipper/Src/models/sender.dart';
import 'package:delivery_app_shipper_shipper/Src/resources/Widgets/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'login_page.dart';
import 'main_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc _registerBloc = new RegisterBloc();

  TextEditingController _nameController = new TextEditingController();

  TextEditingController _emailController = new TextEditingController();

  TextEditingController _phoneNumController = new TextEditingController();

  TextEditingController _homeAddressController = new TextEditingController();

  TextEditingController _officeAddressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  'Register',
                  style: TextStyle(color: Colors.black),
                ),
                leading: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
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
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 22, 15, 0),
                            child: Icon(
                              Icons.account_circle,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 22, 10, 0),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: StreamBuilder(
                              stream: _registerBloc.nameStream,
                              builder: (context, snapshot) => TextField(
                                controller: _nameController,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  errorText:
                                      snapshot.hasError ? snapshot.error : null,
                                  labelText: "FULL NAME",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: InputBorder.none,
                                ),
                              ),
                            )),
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
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Icon(
                              Icons.email,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: StreamBuilder(
                              stream: _registerBloc.emailStream,
                              builder: (context, snapshot) => TextFormField(
                                controller: _emailController,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                // initialValue: _emailController.text,
                                decoration: InputDecoration(
                                  errorText:
                                      snapshot.hasError ? snapshot.error : null,
                                  labelText: "EMAIL",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: InputBorder.none,
                                ),
                              ),
                            )),
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
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Icon(
                              Icons.phone,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: StreamBuilder(
                              stream: _registerBloc.phoneNumStream,
                              builder: (context, snapshot) => TextFormField(
                                controller: _phoneNumController,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: phoneNumberController.text,
                                  errorText:
                                      snapshot.hasError ? snapshot.error : null,
                                  labelText: "PHONE",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: InputBorder.none,
                                ),
                              ),
                            )),
                      ],
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'We will send verification code on above given number',
                          style: TextStyle(color: Colors.black26),
                        )),
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 22, 15, 0),
                            child: Icon(
                              Icons.location_on,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 22, 10, 0),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: StreamBuilder(
                              stream: _registerBloc.homeAddressStream,
                              builder: (context, snapshot) => TextField(
                                controller: _homeAddressController,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: "HOME ADDRESS",
                                  errorText:
                                      snapshot.hasError ? snapshot.error : null,
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: InputBorder.none,
                                ),
                              ),
                            )),
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
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 22, 15, 0),
                            child: Icon(
                              Icons.add_location,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 22, 10, 0),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            controller: _officeAddressController,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "OFFICE ADDRESS",
                              labelStyle: TextStyle(color: Colors.black),
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
        height: 60,
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.all(12),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                onPressed: _onClickedContinue,
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

  Future<void> _onClickedContinue() async {
    String _phone = phoneNumberController.text;
    String _email;
    String _workAddress = _officeAddressController.text;
    String _homeAddress = _homeAddressController.text;
    if (_phone.isEmpty || _phone == null) {
      _phone = _phoneNumController.text;
      _email = email;
    } else {
      _phone = phoneNumberController.text;
      _email = _emailController.text;
    }
    if (_workAddress == null) {
      _workAddress = "";
    }
    if (_homeAddress == null) {
      _homeAddress = "";
    }

    if (_registerBloc.isValidRegister(
        _nameController.text, _email, _phone, _homeAddress, _workAddress)) {
      bool isExistAccount = await isExitAccount(_email, _phone);
      if (!isExistAccount) {
        Account account = new Account.n(_phone, _email, "sender", "active");
        bool checkRegisterAccount = await registerAccount(account);
        if (!checkRegisterAccount) {
          _errAlert(context, "The system is failed, registration failed");
        } else {
          saveAccount(account);
          Sender sender = new Sender.m(_nameController.text,  _homeAddressController.text, _officeAddressController.text, _phone);
          bool checkRegisterSender = await registerSender(sender);
          if (!checkRegisterSender) {
            _errAlert(context, "The system is failed, registration failed");
          } else {
            await saveSender(_phone);
            await saveBalance(_phone);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          }
        }
      } else {
        _errAlert(context, "Phone or email is existed");
      }
    }
  }

  //Đăng ký tài khoản
  Future<bool> registerAccount(Account account) async {
    RegisterApi api = new RegisterApi();
    Response response = await api.postAccount(account);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  //Điền thông tin cho sender
  Future<bool> registerSender(Sender sender) async {
    RegisterApi api = new RegisterApi();
    Response response = await api.postSender(sender);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveAccount(Account account) async {
    SaveData save = new SaveData();
    save.saveAccount(account);
  }

  //Lưu lại số dư trong tài khoản vào máy
  Future<void> saveBalance(String phone) async {
    RegisterApi api = new RegisterApi();
    Response response = await api.getSenderByPhoneNum(phone);
    if (response.statusCode == 200) {
      Sender sender = await api.convertJsonToSender(response);
      double balance = await api.getBalance(sender.walletId);
      SaveData save = new SaveData();
      save.saveBalance(balance);
    }
  }

  //Save thông tin Sender vào local
  Future<void> saveSender(String phone) async {
    RegisterApi api = new RegisterApi();
    Response response = await api.getSenderByPhoneNum(phone);
    if (response.statusCode == 200) {
      Sender sender = await api.convertJsonToSender(response);
      SaveData save = new SaveData();
      //save.saveSender(sender);
    }
  }

  //Kiểm tra email hoặc số điện thoại tồn tại chưa
  Future<bool> isExitAccount(String email, String phone) async {
    RegisterApi api = new RegisterApi();
    if (await api.isExistAccountByEmail(email)) {
      return true;
    } else if (await api.isExistAccountByPhone(phone)) {
      return true;
    } else {
      return false;
    }
  }

  Future _errAlert(BuildContext context, String err) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register fail'),
          content: Text('$err'),
          actions: [
            FlatButton(
              child: Text('Exit'),
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

