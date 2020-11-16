import 'package:delivery_app_shipper_shipper/Src/models/account.dart';
import 'package:delivery_app_shipper_shipper/Src/models/sender.dart';
import 'package:delivery_app_shipper_shipper/Src/models/shipper.dart';
import 'package:delivery_app_shipper_shipper/Src/models/wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  Future<void> saveAccount(Account account) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('phoneNum', account.phoneNum);
    sp.setString('email', account.email);
  }

  Future<void> saveShipper(Shipper shipper) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('id', shipper.id);
    sp.setString('name', shipper.name);
    sp.setString('homeAddress', shipper.homeAddress);
    sp.setString('workAddress', shipper.workAddress);
    sp.setString('walletId', shipper.walletId);
  }

  Future<void> saveBalance(double balance) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setDouble('balance', balance);
  }

  Future<double> getBalance() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getDouble('balance');
  }

  Future<String> getWalletId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('walletId');
  }

  Future<String> getWorkAddress() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('workAddress');
  }

  Future<String> getHomeAddress() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('homeAddress');
  }

  Future<String> getName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('name');
  }

  Future<String> getId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('id');
  }

  Future<String> getPhoneNum() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('phoneNum');
  }

  Future<String> getEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('email');
  }

  Future<Sender> getSender() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String id = sp.getString('id');
    String name = sp.getString('name');
    String homeAddress = sp.getString('homeAddress');
    String workAddress = sp.getString('workAddress');
    String phoneNum = sp.getString('phoneNum');
    String walletId = sp.getString('walletId');
    return new Sender.n(id, name, homeAddress, workAddress, phoneNum, walletId);
  }
}