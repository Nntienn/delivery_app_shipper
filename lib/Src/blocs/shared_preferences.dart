import 'package:delivery_app_shipper_shipper/Src/models/account.dart';
import 'package:delivery_app_shipper_shipper/Src/models/shipper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:delivery_app_shipper_shipper/Src/models/transaction_detail.dart';

class SaveData {
  Future<void> saveAccount(Account account) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('phoneNum', account.phoneNum);
    sp.setString('email', account.email);
  }

  Future<void> saveTransactionDetail(TransactionDetail model) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('transactionDetailsId', model.transactionDetailsId);
    sp.setString('pickedTime', model.pickedTime);
    sp.setString('completedTime', model.completedTime);
  }

  Future<void> saveShipper(Shipper shipper) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('id', shipper.shipperId);
    sp.setString('name', shipper.name);
    sp.setString('identifyCard', shipper.cmnd);
    sp.setString('walletId', shipper.walletId);
  }

  Future<int> getTransactionDetailsId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt('transactionDetailsId');
  }

  Future<String> getPickedTime() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('pickedTime');
  }

  Future<String> getCompletedTime() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('completedTime');
  }

  Future<void> saveBalance(double balance) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setDouble('balance', balance);
  }

  Future<String> getIdentifyCard() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('identifyCard');
  }

  Future<double> getBalance() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getDouble('balance');
  }

  Future<String> getWalletId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('walletId');
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

  Future<void> logOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }

  // Future<Sender> getShipper() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   String id = sp.getString('id');
  //   String name = sp.getString('name');
  //   String phoneNum = sp.getString('phoneNum');
  //   String walletId = sp.getString('walletId');
  //   return new Sender.n(id, name, phoneNum, walletId);
  // }
}